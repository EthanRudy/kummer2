/* 
See "CMUgraphics.h" for version info and copyright information
This file was last modified on 06.12.2000
*/

#include <cstdio>
#include <cmath>

#include <CMUgraphics.h>
#include <colors.h>

using namespace std;

const char window::ccDefWindClassName[] = "CMUgraphics Library";
const char window::ccDefWindTitle[] = "Graphics Window";
const int window::ciDefWindWidth = 640;
const int window::ciDefWindHeight = 480;
const int window::ciDefWindXPos = CW_USEDEFAULT;
const int window::ciDefWindYPos = 0;
const int window::ciDefBrushSize = 1;
    
bool window::bWaitClose = true;
map<HWND, window *> *window::mapWindow = NULL;

LRESULT CALLBACK window::WindowProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam) {
	
	switch(msg) {
	  case WM_QUIT:
	  case WM_DESTROY:
	    exit(0);
	    return 0;
	    
	  case WM_LBUTTONDOWN:
        SetMouseState(hwnd, LEFT_BUTTON, BUTTON_DOWN, LOWORD(lParam), HIWORD(lParam));
		SetCapture(hwnd);
 		return 0;

	  case WM_RBUTTONDOWN:
        SetMouseState(hwnd, RIGHT_BUTTON, BUTTON_DOWN, LOWORD(lParam), HIWORD(lParam));
		SetCapture(hwnd);
 		return 0;	
	
	  case WM_LBUTTONUP:
        SetMouseState(hwnd, LEFT_BUTTON, BUTTON_UP, LOWORD(lParam), HIWORD(lParam));
        SetClickInfo(hwnd, LEFT_CLICK, LOWORD(lParam), HIWORD(lParam));
		ReleaseCapture();
 		return 0;

	  case WM_RBUTTONUP:
        SetMouseState(hwnd, RIGHT_BUTTON, BUTTON_UP, LOWORD(lParam), HIWORD(lParam));
        SetClickInfo(hwnd, RIGHT_CLICK, LOWORD(lParam), HIWORD(lParam));
		ReleaseCapture();
 		return 0;

	  case WM_MOUSEMOVE:
        SetMouseCoord(hwnd, LOWORD(lParam), HIWORD(lParam));
 		return 0;

	  case WM_KEYDOWN:
	    switch(wParam) {
		  case VK_END:
            SetKeyInfo(hwnd, ARROW, 1);
			break;

		  case VK_DOWN:
            SetKeyInfo(hwnd, ARROW, 2);
			break;

		  case VK_NEXT:
            SetKeyInfo(hwnd, ARROW, 3);
			break;

		  case VK_LEFT:
            SetKeyInfo(hwnd, ARROW, 4);
			break;

		  case VK_RIGHT:
            SetKeyInfo(hwnd, ARROW, 6);
			break;

		  case VK_HOME:
            SetKeyInfo(hwnd, ARROW, 7);
			break;

		  case VK_UP:
            SetKeyInfo(hwnd, ARROW, 8);
			break;

		  case VK_PRIOR:
            SetKeyInfo(hwnd, ARROW, 9);
			break;

		  case VK_ESCAPE:
            SetKeyInfo(hwnd, ESCAPE, 1);
			break;

		  case VK_F1:
            SetKeyInfo(hwnd, FUNCTION, 1);
			break;

		  case VK_F2:
            SetKeyInfo(hwnd, FUNCTION, 2);
			break;

		  case VK_F3:
            SetKeyInfo(hwnd, FUNCTION, 3);
			break;

		  case VK_F4:
            SetKeyInfo(hwnd, FUNCTION, 4);
			break;


		  case VK_F5:
            SetKeyInfo(hwnd, FUNCTION, 5);
			break;

		  case VK_F6:
            SetKeyInfo(hwnd, FUNCTION, 6);
			break;

		  case VK_F7:
            SetKeyInfo(hwnd, FUNCTION, 7);
			break;

		  case VK_F8:
            SetKeyInfo(hwnd, FUNCTION, 8);
			break;

		  case VK_F9:
            SetKeyInfo(hwnd, FUNCTION, 9);
			break;

		  case VK_F10:
            SetKeyInfo(hwnd, FUNCTION, 10);
			break;

		  case VK_F11:
            SetKeyInfo(hwnd, FUNCTION, 11);
			break;

		  case VK_F12:
            SetKeyInfo(hwnd, FUNCTION, 12);
			break;
		}
		return 0;

	  case WM_CHAR:
        SetKeyInfo(hwnd, ASCII, static_cast<char>(wParam));
		return 0;
	}
	
    return DefWindowProc(hwnd, msg, wParam, lParam);
}

window::window(const int iWindWidth, 
               const int iWindHeight, 
               const int iWindXPos, 
               const int iWindYPos) : 
		hInstance(GetModuleHandle(0)), 
        iWindowWidth(iWindWidth), 
        iWindowHeight(iWindHeight),
        iMouseX(-1),
        iMouseY(-1),
        bsLeft(BUTTON_UP),
        bsRight(BUTTON_UP),
        penOldObject(NULL),
        penObject(NULL),
        brshOldObject(NULL),
        brshObject(NULL),
        fontOldObject(NULL),
        fontObject(NULL),
        bmapBuffer(NULL),
        bDoubleBuffer(false) {

	wndcWindow.style = 0;
	wndcWindow.lpfnWndProc = WindowProc;
	wndcWindow.cbClsExtra = 0;
	wndcWindow.cbWndExtra = 0;
	wndcWindow.hInstance = hInstance;
	wndcWindow.hIcon = NULL;
	wndcWindow.hCursor = LoadCursor(NULL, IDC_ARROW);
	wndcWindow.hbrBackground = (HBRUSH)GetStockObject(WHITE_BRUSH);
	wndcWindow.lpszMenuName = NULL;
	wndcWindow.lpszClassName = ccDefWindClassName;
	RegisterClass(&wndcWindow);

	hwndWindow = CreateWindow(ccDefWindClassName, 
	                          ccDefWindTitle, 
	                          WS_CAPTION | WS_SYSMENU | WS_VISIBLE | WS_MINIMIZEBOX, 
	                          iWindXPos, 
		                      iWindYPos, 
		                      iWindowWidth + GetSystemMetrics(SM_CXEDGE), 
							  iWindowHeight + GetSystemMetrics(SM_CYCAPTION) + GetSystemMetrics(SM_CYEDGE) - 1, // Not sure why I need to subtract 1
							  HWND_DESKTOP, 
							  NULL, 
							  hInstance, 
							  0);
							  							  
	if(hwndWindow) {
	    if(mapWindow == NULL) {
	    	mapWindow = new map<HWND, window *>;
	    }
	    
   	    (*mapWindow)[hwndWindow] = this;
		ShowWindow(hwndWindow, SW_SHOW);
		dcScreen = GetDC(hwndWindow);
		
        // No doublebuffering yet so dcActive is the same as dcScreen
		dcActive = dcScreen;
	}	

    SetPen(WHITE, 0);
    SetBrush(WHITE);
    SetFont(10, PLAIN, SWISS);
}

window::~window() {

    int iX, iY;

    if(dcScreen != NULL) {
        if(ReleaseDC(hwndWindow, dcScreen) == 0) {
		  error(SYSTEM, "Failed to release dcScreen in window class destructor!");
        }
        if(dcActive == dcScreen) {
          dcActive = NULL;
        }
        dcScreen = NULL;
    }

	if (dcActive != NULL) {
		if(DeleteDC(dcActive) != TRUE) {
			error(SYSTEM, "Failed to delete dcActive in window class destructor!");
		}
	}
	
	if(penObject != NULL) { 
	    if(DeleteObject(penObject) != TRUE) {
	        error(SYSTEM, "Failed to delete penObject in window class destructor!");	        	    
	    }
		penObject = NULL; 
	}

	if(brshObject != NULL) { 
	    if(DeleteObject(brshObject) != TRUE) {
	        error(SYSTEM, "Failed to delete brshObject in window class destructor!");	        	    	    
	    }
		brshObject = NULL; 
	}

	if(fontObject != NULL) {
	    if(DeleteObject(fontObject) != TRUE) {
	        error(SYSTEM, "Failed to delete fontObject in window class destructor!");	        	    	    
	    }
		fontObject = NULL; 
	}

    if(bmapBuffer != NULL) {
    	if(DeleteObject(bmapBuffer) != TRUE) {
	        error(SYSTEM, "Failed to delete bmapBuffer in window class destructor!");	        	    
    	}
    	bmapBuffer = NULL;
    }


    if(mapWindow->size() == 1) {
        if(bWaitClose == true) {
          FlushMouseQueue();
          // Can't use cout because it's destructor might be called before the 
          // window destructor if the window is in the global scope.
          printf("Click mouse in the graphics window to finish execution.\n");
          WaitMouseClick(iX, iY);
      	     
        }
        mapWindow->erase(mapWindow->find(hwndWindow));        
        delete mapWindow;
        mapWindow = NULL;
   	} else {
	    mapWindow->erase(mapWindow->find(hwndWindow));   	
   	}
   	
    DestroyWindow(hwndWindow);

}


inline void window::ProcessMessage() {

    MSG msgStruct;
	
    if(PeekMessage(&msgStruct, hwndWindow, 0, 0, PM_REMOVE)) {
	    TranslateMessage(&msgStruct);
		DispatchMessage(&msgStruct);
	}
}

void window::ChangeDrawStyle(drawstyle dsNewStyle) {

    switch(dsNewStyle) {
      case FILLED:
	    penOldObject = static_cast<HPEN>(SelectObject(dcActive, penObject));
		brshOldObject = static_cast<HBRUSH>(SelectObject(dcActive, brshObject));
		SetROP2(dcActive, R2_COPYPEN);
		break;

      case FRAME:
		penOldObject = static_cast<HPEN>(SelectObject(dcActive, penObject));
		brshOldObject = static_cast<HBRUSH>(SelectObject(dcActive, GetStockObject(NULL_BRUSH)));
		SetROP2(dcActive, R2_COPYPEN);
		break;

      case INVERTED:
		penOldObject = static_cast<HPEN>(SelectObject(dcActive, GetStockObject(BLACK_PEN)));
		brshOldObject = static_cast<HBRUSH>(SelectObject(dcActive, GetStockObject(BLACK_BRUSH)));
		SetROP2(dcActive, R2_NOT);
		break;

      default:
        error(USER, "You have tried to use an invalid drawstyle!");
		break;
  	}

}

void window::RestoreDrawStyle() {

    SelectObject(dcActive, penOldObject);
    SelectObject(dcActive, brshOldObject);

}

bool window::SetWaitClose(const bool bSetting) const {

  bool bReturnVal = bWaitClose;
  bWaitClose = bSetting;

  return bReturnVal;
}

bool window::SetBuffering(const bool bSetting) {

    bool bReturnVal;

	ProcessMessage(); // Kludge

    // Is this changing the setting?
    if(bDoubleBuffer == bSetting) {
        return bDoubleBuffer;
    } else {
        bReturnVal = bDoubleBuffer;
	    bDoubleBuffer = bSetting;
    }
    
	if(bDoubleBuffer == true) {

	    bmapBuffer = CreateDiscardableBitmap(dcActive, iWindowWidth, iWindowHeight);

		dcScreen = dcActive;

        dcActive = CreateCompatibleDC(dcScreen);	
        if(dcActive != NULL) {
            bmapBufferOld = static_cast<HBITMAP>(SelectObject(dcActive, bmapBuffer));
        }
        
        SetPen(WHITE);
        SetBrush(WHITE);
        DrawRectangle(0, 0, iWindowWidth - 1, iWindowHeight - 1);

	} else {
	
	    SelectObject(dcActive, bmapBufferOld);
	
  	    if(dcActive != NULL) {
		    if(DeleteDC(dcActive) != TRUE) {
		      error(SYSTEM, "Failed to delete dcActive in SetBuffering!");
		    }
		    dcActive = NULL;
	    }
	    
	    if(bmapBuffer != NULL) {
	        if(DeleteObject(bmapBuffer) != TRUE) {
	            error(SYSTEM, "Failed to delete bmapBuffer in SetBuffering!");	    	            
	        }
	        bmapBuffer = NULL;
	    }
	
		dcActive = dcScreen;

	}
	
	return bReturnVal;
}

void window::UpdateBuffer() {

	ProcessMessage(); // Kludge
		
	if(bDoubleBuffer != false) {
        if(BitBlt(dcScreen, 0, 0, iWindowWidth - 1, iWindowHeight - 1, dcActive, 0, 0, SRCCOPY) != TRUE) {
            error(SYSTEM, "Failed to BitBlt in UpdateBuffer!");
        }
	}
}

void window::ChangeTitle(const char* cpNewTitle) {

	ProcessMessage(); // Kludge
    SetWindowText(hwndWindow, cpNewTitle);

}

void window::ChangeTitle(string strNewTitle) {
	ChangeTitle(static_cast<const char *>(strNewTitle.c_str()));
}

int window::GetWidth() const {
    return iWindowWidth;
}

int window::GetHeight() const {
    return iWindowHeight;
}

void window::GetWindowSize(int &iX, int &iY) const {
	iX = iWindowWidth;
	iY = iWindowHeight;
}

void window::GetMouseCoord(int &iX, int &iY) {

    ProcessMessage(); // Kludge

	iX = iMouseX;
	iY = iMouseY;
}

buttonstate window::GetButtonState(const button btMouse, int &iX, int &iY) {

    ProcessMessage(); // Kludge

	iX = iMouseX;
	iY = iMouseY;
	
	if(btMouse == LEFT_BUTTON)
	    return bsLeft;
	else
	    return bsRight;
	    
}

clicktype window::GetMouseClick(int &iX, int &iY) {

    ProcessMessage(); // Kludge

    if(!queMInput.empty()) {
        pair<clicktype, pair<int, int> > temp = queMInput.front();
        queMInput.pop();        

		iX = temp.second.first;
		iY = temp.second.second;
		return temp.first;
		
	} else {
		iX = -1;
		iY = -1;
		return NO_CLICK;
	}
}


keytype window::GetKeyPress(char &cKey) {

    ProcessMessage(); // Kludge

	if(!queKInput.empty()) {
	
	    pair<keytype, char> temp = queKInput.front();
	    queKInput.pop();
	    
		cKey = temp.second;
		return temp.first;

	} else {
		cKey = 0;
		return NO_KEYPRESS;
	}
}

clicktype window::WaitMouseClick(int &iX, int &iY) {

	while(queMInput.empty()) 
        ProcessMessage(); // Kludge
	
    pair<clicktype, pair<int, int> > temp = queMInput.front();
    queMInput.pop();        

	iX = temp.second.first;
	iY = temp.second.second;
	return temp.first;

}

keytype window::WaitKeyPress(char &cKey) {

	while(queKInput.empty()) 
        ProcessMessage(); // Kludge
	
	pair<keytype, char> temp = queKInput.front();
	queKInput.pop();
	    
	cKey = temp.second;
	return temp.first;		

}

void window::FlushKeyQueue() {

    ProcessMessage(); // Kludge
    while(!queKInput.empty())
      queKInput.pop();

}

void window::FlushMouseQueue() {

    ProcessMessage(); // Kludge
    while(!queMInput.empty()) 
      queMInput.pop();

}

color window::SetBrush(const double dRed, const double dGreen, const double dBlue) {

	return SetBrush(static_cast<unsigned char>(dRed * 255), 
	                static_cast<unsigned char>(dGreen * 255), 
	                static_cast<unsigned char>(dBlue * 255));

}

color window::SetBrush(const color &colBrush) {

    return SetBrush(colBrush.ucRed, colBrush.ucGreen, colBrush.ucBlue);

}

color window::SetBrush(const unsigned char ucRed, 
                       const unsigned char ucGreen, 
                       const unsigned char ucBlue) {

	ProcessMessage(); // Kludge

    color colReturn = colBrsh;

	if (brshObject != NULL) { 
	    if(DeleteObject(brshObject) != TRUE) {
	        error(SYSTEM, "Failed to delete brshObject in SetBrush!");	    	    
	    }
		brshObject = NULL; 
	}
	
	colBrsh.ucRed = ucRed;
	colBrsh.ucGreen = ucGreen;
	colBrsh.ucBlue = ucBlue;
	
	brshObject = CreateSolidBrush(RGB(ucRed, ucGreen, ucBlue));

    return colReturn;
}

color window::SetPen(const double dRed, const double dGreen, const double dBlue, const int iWidth) {

	return SetPen(static_cast<unsigned char>(dRed * 255), 
	              static_cast<unsigned char>(dGreen * 255), 
	              static_cast<unsigned char>(dBlue * 255), 
	              iWidth);
}

color window::SetPen(const color &colPen, const int iWidth) {

    return SetPen(colPen.ucRed, colPen.ucGreen, colPen.ucBlue, iWidth);

}

color window::SetPen(const unsigned char ucRed, const unsigned char ucGreen, const unsigned char ucBlue, const int iWidth) {

	ProcessMessage(); // Kludge

    color colReturn = colPen;

	if (penObject != NULL) { 
	    if(DeleteObject(penObject) != TRUE) {
	        error(SYSTEM, "Failed to delete penObject in SetPen!");	    
	    }
		penObject = NULL; 
	}

    iPenWidth = iWidth;
    colPen.ucRed = ucRed;
    colPen.ucGreen = ucGreen;
    colPen.ucBlue = ucBlue;

    // Not the best place to put it, but I didn't want to create
    // too many functions to set colors.
    SetTextColor(dcActive, RGB(ucRed, ucGreen, ucBlue));
  
	penObject = CreatePen(PS_INSIDEFRAME, iWidth, RGB(ucRed, ucGreen, ucBlue));
	
	return colReturn;
}

void window::SetFont(const int iSize, const unsigned short usStyle, const fontfamily ffFamily, const char *cFontName) {

	LOGFONT lf;

    ProcessMessage(); // Kludge
	
    memset(&lf, 0, sizeof(LOGFONT));
	
	if(fontObject != NULL) { 
	    if(DeleteObject(fontObject) != TRUE) {
            error(SYSTEM, "Failed to delete fontObject in SetFont!");	        	    		    	    
	    }
		fontObject = NULL; 
	}
	
	lf.lfHeight = iSize;
	lf.lfWidth = 0;
	lf.lfEscapement = 0;
	lf.lfOrientation = 0;

	if((usStyle & BOLD) == BOLD)
	    lf.lfWeight = FW_BOLD;
	else 
	    lf.lfWeight = FW_NORMAL;

	if((usStyle & ITALICIZED) == ITALICIZED) 
	    lf.lfItalic = true;
	else 
		lf.lfItalic = false;

	if((usStyle & UNDERLINED) == UNDERLINED)
        lf.lfUnderline = true;
	else
        lf.lfUnderline = false;

	if((usStyle & STRIKEOUT) == STRIKEOUT) 
        lf.lfStrikeOut = true;
	else 
        lf.lfStrikeOut = false;

	lf.lfStrikeOut = FALSE;
	lf.lfCharSet = DEFAULT_CHARSET;
	lf.lfOutPrecision = OUT_DEFAULT_PRECIS;
	lf.lfClipPrecision = CLIP_DEFAULT_PRECIS;
	lf.lfQuality = DEFAULT_QUALITY;
	
	switch(ffFamily) {
	  case MODERN: 
	    lf.lfPitchAndFamily = FF_MODERN; 
		break;

	  case ROMAN:  
		lf.lfPitchAndFamily = FF_ROMAN; 
		break;

      case SCRIPT: 
		lf.lfPitchAndFamily = FF_SCRIPT; 
		break;

	  case SWISS:  
		lf.lfPitchAndFamily = FF_SWISS; 
		break;

	  default:	 
	    lf.lfPitchAndFamily = FF_DONTCARE; 
		break;
	}

	lf.lfPitchAndFamily |= DEFAULT_PITCH;
	if(cFontName)
		strcpy(lf.lfFaceName, cFontName);
	
	fontObject = CreateFontIndirect(&lf);

}

void window::SetFontStyle() {
	fontOldObject = (HFONT) SelectObject(dcActive, fontObject);
}

void window::RestoreFontStyle() {
	SelectObject(dcActive, fontOldObject);
}

void window::DrawPixel(const int iX, const int iY) {

    // Cheap trick to change pen width
    HPEN penTemp = penObject;
    penObject = NULL;
   	penObject = CreatePen(PS_INSIDEFRAME, 1, RGB(colPen.ucRed, colPen.ucGreen, colPen.ucBlue));

    DrawLine(iX, iY, iX + 1, iY + 1);
    
	if (penObject != NULL) { 
	    if(DeleteObject(penObject) != TRUE) {
	        error(SYSTEM, "Failed to delete penObject in SetPen!");	    
	    }
		penObject = NULL; 
	}    
    
    penObject = penTemp;

}

void window::DrawLine(const int iX1, const int iY1, const int iX2, const int iY2) {

    ProcessMessage(); // Kludge

    ChangeDrawStyle(FRAME);
	if(MoveToEx(dcActive, iX1, iY1, NULL) != TRUE) 
		error(SYSTEM, "Failed to MoveToEx in DrawLine!");	        	    		    
	  
	if(LineTo(dcActive, iX2, iY2) != TRUE) 
    	error(SYSTEM, "Failed to draw in DrawLine!");	        	    		    
	   
	RestoreDrawStyle();
}

void window::DrawRectangle(const int iX1, 
                           const int iY1, 
                           const int iX2, 
                           const int iY2, 
                           const drawstyle dsStyle, 
                           const int iWidth, 
                           const int iHeight) {

	HRGN rgnTemp;
	ProcessMessage(); // Kludge
	
	if((iWidth == 0) && (iHeight == 0)) {

	    switch(dsStyle) {

   		  case FILLED:
		    ChangeDrawStyle(FILLED);
	        if(Rectangle(dcActive, iX1, iY1, iX2, iY2) != TRUE) {
                error(SYSTEM, "Failed to draw filled style in DrawRectangle!");	        	    		    
	        }
	        RestoreDrawStyle();
	        break;

		  case FRAME:
            ChangeDrawStyle(FRAME);
 	        if(Rectangle(dcActive, iX1, iY1, iX2, iY2) != TRUE) {
                error(SYSTEM, "Failed to draw frame style in DrawRectangle!");	        	    		    
 	        }
 	        RestoreDrawStyle();
			break;
		
		  case INVERTED:
  	        ChangeDrawStyle(INVERTED);
			if(Rectangle(dcActive, iX1, iY1, iX2, iY2) != TRUE) {
                error(SYSTEM, "Failed to draw inverted style in DrawRectangle!");	        	    		    
			}
			RestoreDrawStyle();
			break;

		  default:
			error(USER, "You have tried to use an invalid drawstyle!");
			break;
		}

	} else {

	    switch(dsStyle) {

  	      case FILLED:
			ChangeDrawStyle(FILLED);	    
	        if(RoundRect(dcActive, iX1, iY1, iX2, iY2, iWidth, iHeight) != TRUE) {
                error(SYSTEM, "Failed to draw filled style in DrawRectangle (rounded)!");	        	    		    
	        }
	        RestoreDrawStyle();
			break;

		  case FRAME:
			ChangeDrawStyle(FRAME);
			if(RoundRect(dcActive, iX1, iY1, iX2, iY2, iWidth, iHeight) != TRUE) {
                error(SYSTEM, "Failed to draw frame style in DrawRectangle (rounded)!");	        	    		    
			}
			RestoreDrawStyle();
			break;
		
		  case INVERTED:
			rgnTemp = CreateRoundRectRgn(iX1, iY1, iX2, iY2, iWidth, iHeight);
			if(InvertRgn(dcActive,rgnTemp) != TRUE) {
                error(SYSTEM, "Failed to draw inverted style in DrawRectangle (rounded)!");	        	    		    			
			}
			DeleteObject(rgnTemp);
			break;

		  default:
			error(USER, "You have tried to use an invalid drawstyle!");
			break;
		}
	}
}

void window::DrawTriangle(const int iX1, 
                          const int iY1, 
                          const int iX2, 
                          const int iY2, 
                          const int iX3, 
                          const int iY3, 
                          const drawstyle dsStyle) {

	HRGN rgnTemp;
	POINT ptVertices[3] = {{iX1, iY1}, {iX2, iY2}, {iX3, iY3}};

	ProcessMessage(); // Kludge
    switch(dsStyle) {
      case FILLED:
		ChangeDrawStyle(FILLED);	    
 	    if(Polygon(dcActive, ptVertices, 3) != TRUE) {
            error(SYSTEM, "Failed to draw filled style in DrawTriangle!");	        	    		    
 	    }
 	    RestoreDrawStyle();
		break;

	  case FRAME:
		ChangeDrawStyle(FRAME);
 	    if(Polygon(dcActive, ptVertices, 3) != TRUE) {
        	error(SYSTEM, "Failed to draw frame style in DrawTriangle!");	        	    		    
 	    }
 	    RestoreDrawStyle();
		break;
		
	  case INVERTED:
		rgnTemp = CreatePolygonRgn(ptVertices, 3, WINDING);
 	    if(InvertRgn(dcActive, rgnTemp) != TRUE) {
            error(SYSTEM, "Failed to draw inverted style in DrawTriangle!");	        	    		     	    
 	    }
		DeleteObject(rgnTemp);
		break;

	  default:
	    error(USER, "You have tried to use an invalid drawstyle!");
		break;
	}
	
}

void window::DrawPolygon(const int* ipX, const int* ipY, const int iVertices, const drawstyle dsStyle) {

	HRGN rgnTemp;
	POINT *ptVertices = new POINT[iVertices];
    if(ptVertices == NULL) {
		error(OUT_OF_MEMORY, "Creating vertices in DrawPolygon!");
	}

	for(unsigned short i = 0; i < iVertices; i++) {
		ptVertices[i].x = ipX[i];
		ptVertices[i].y = ipY[i];
	}

	ProcessMessage(); // Kludge
    switch(dsStyle) {
      case FILLED:
		ChangeDrawStyle(FILLED);	    
 	    if(Polygon(dcActive, ptVertices, iVertices) != TRUE) {
            error(SYSTEM, "Failed to draw filled style in DrawPolygon!");	        	    		    
 	    }
 	    RestoreDrawStyle();
		break;

	  case FRAME:
		ChangeDrawStyle(FRAME);
 	    if(Polygon(dcActive, ptVertices, iVertices) != TRUE) {
            error(SYSTEM, "Failed to draw frame style in DrawPolygon!");	        	    		     	    
 	    }
 	    RestoreDrawStyle();
		break;
		
	  case INVERTED:
		rgnTemp = CreatePolygonRgn(ptVertices, iVertices, WINDING);
	    if(InvertRgn(dcActive, rgnTemp) != TRUE) {
            error(SYSTEM,"Failed to draw inverted style in DrawPolygon!");	        	    		    
	    }
		DeleteObject(rgnTemp);
		break;

	  default:
		delete ptVertices;
	    error(USER, "You have tried to use an invalid drawstyle!");
		break;
	}

	delete ptVertices;
}

void window::DrawCircle(const int iX, 
                        const int iY, 
                        const int iRadius, 
                        const drawstyle dsStyle) {

	HRGN rgnTemp;
	ProcessMessage(); // Kludge
    switch(dsStyle) {
      case FILLED:
		ChangeDrawStyle(FILLED);	    
 	    if(Ellipse(dcActive, (iX - iRadius), (iY - iRadius), (iX + iRadius), (iY + iRadius)) != TRUE) {
            error(SYSTEM, "Failed to draw filled style in DrawCircle!");	        	    		     	    
 	    }
 	    RestoreDrawStyle();
		break;

	  case FRAME:
		ChangeDrawStyle(FRAME);
 	    if(Ellipse(dcActive, (iX - iRadius), (iY - iRadius), (iX + iRadius), (iY + iRadius)) != TRUE) {
 	        error(SYSTEM, "Failed to draw frame style in DrawCircle!");	        	    		    
	    }
 	    RestoreDrawStyle();
		break;
		
	  case INVERTED:
		rgnTemp = CreateEllipticRgn((iX - iRadius), (iY - iRadius), (iX + iRadius), (iY + iRadius));
 	    if(InvertRgn(dcActive, rgnTemp) != TRUE) {
            error(SYSTEM, "Failed to draw inverted style in DrawCircle!");	        	    		     	    
 	    }
		DeleteObject(rgnTemp);
		break;

	  default:
		error(USER, "You have tried to use an invalid drawstyle!");
		break;
	}
}

void window::DrawEllipse(const int iX1, 
                         const int iY1, 
                         const int iX2, 
                         const int iY2, 
                         const drawstyle dsStyle) {

	HRGN rgnTemp;
	ProcessMessage(); // Kludge
	switch(dsStyle) {
      case FILLED:
		ChangeDrawStyle(FILLED);
		if(Ellipse(dcActive, iX1, iY1, iX2, iY2) != TRUE) {
            error(SYSTEM, "Failed to draw filled style in DrawEllipse!");	        	    		    
		}
		RestoreDrawStyle();
		break;

	  case FRAME:
		ChangeDrawStyle(FRAME);
 	    if(Ellipse(dcActive, iX1, iY1, iX2, iY2) != TRUE) {
            error(SYSTEM, "Failed to draw frame style in DrawEllipse!");	        	    		     	    
 	    }
 	    RestoreDrawStyle();
		break;
		
	  case INVERTED:
	    rgnTemp = CreateEllipticRgn(iX1, iY1, iX2, iY2);
 	    if(InvertRgn(dcActive, rgnTemp) != TRUE) {
            error(SYSTEM, "Failed to draw inverted style in DrawEllipse!");	        	    		     	    
 	    }
		DeleteObject(rgnTemp);
		break;

	  default:
		error(USER, "You have tried to use an invalid or unimplemented drawstyle!");
		break;
	}

}

void window::DrawArc(const int iX1, 
                     const int iY1, 
                     const int iX2, 
                     const int iY2, 
                     double dStartAngle, 
                     double dEndAngle, 
                     const drawstyle dsStyle, 
                     const angletype atInfo){

	ProcessMessage(); // Kludge
	
	// x-axis, y-axis dimensions
	int iWidth = (iX2 - iX1) / 2;
	int iHeight = (iY2 - iY1) / 2;

    // center pixel
	int iCenterX = (iX2 + iX1) / 2;
	int iCenterY = (iY2 + iY1) / 2;
	
	if(atInfo != RADIANS) {
	    dStartAngle = dStartAngle * (cdPi / 180);
	    dEndAngle = dEndAngle * (cdPi / 180);
	}

    // start pixel
	int iStartX = iCenterX + static_cast<int>(iWidth * cos(dStartAngle));
	int iStartY = iCenterY - static_cast<int>(iHeight * sin(dStartAngle));
	
	// end pixel
	int iEndX = iCenterX + static_cast<int>(iWidth * cos(dEndAngle));
	int iEndY = iCenterY - static_cast<int>(iHeight * sin(dEndAngle));

	switch(dsStyle) {
	  case FILLED:
        ChangeDrawStyle(FILLED);
	    if(Pie(dcActive, iX1, iY1, iX2, iY2, iStartX, iStartY, iEndX, iEndY) != TRUE) {
            error(SYSTEM, "Failed to draw filled style in DrawArc!");	        	    		    
	    }
	    RestoreDrawStyle();
		break;

	  case FRAME:
        ChangeDrawStyle(FRAME);
	    if(Arc(dcActive, iX1, iY1, iX2, iY2, iStartX, iStartY, iEndX, iEndY) != TRUE) {
            error(SYSTEM, "Failed to draw frame style in DrawArc!");	        	    		    
	    }
	    RestoreDrawStyle();
		break;

	  case INVERTED:
        ChangeDrawStyle(INVERTED);
	    if(Pie(dcActive, iX1, iY1, iX2, iY2, iStartX, iStartY, iEndX, iEndY) != TRUE) {
            error(SYSTEM, "Fatal Error: Failed to draw inverted style in DrawArc!");	        	    		    
	    }
	    RestoreDrawStyle();
		break;

	  default:
	    error(USER, "You have tried to use an invalid or unimplemented drawstyle!");
		break;
	}
}

void window::DrawBezierSpline(const int iX1, 
                     	      const int iY1, 
                	          const int iX2, 
                	          const int iY2, 
             	              const int iX3, 
              		          const int iY3, 
                 	          const int iX4, 
                	          const int iY4) {

	ProcessMessage(); // Kludge

	POINT ptControlPts[4] = {{iX1, iY1}, {iX2, iY2}, {iX3, iY3}, {iX4, iY4}};
	      
    ChangeDrawStyle(FRAME);
	if(PolyBezier(dcActive, ptControlPts, 4) != TRUE) {
    	error(SYSTEM, "Failed to draw in DrawBezier!");	        	    		  
	}
	RestoreDrawStyle();

}

void window::DrawCatmullRomSpline(const int* ipX, const int* ipY, const int iVertices) {
  for(int i = 1; i < (iVertices - 2); i++) {

    int n = 64; // Number of subdivisions
    double s = 1.0 / static_cast<double>(n);
    double s2 = s*s;
    double s3 = s2*s;

    double ax = (0.5 * (ipX[i + 2] - 3*ipX[i+1] + 3*ipX[i] - ipX[i-1]));
    double bx = (0.5 * (-1*ipX[i+2] + 4*ipX[i+1] - 5*ipX[i] + 2*ipX[i-1]));
    double cx = (0.5 * (ipX[i+1] - ipX[i-1]));
    double dx = ipX[i];

    double ay = (0.5 * (ipY[i + 2] - 3*ipY[i+1] + 3*ipY[i] - ipY[i-1]));
    double by = (0.5 * (-1*ipY[i+2] + 4*ipY[i+1] - 5*ipY[i] + 2*ipY[i-1]));
    double cy = (0.5 * (ipY[i+1] - ipY[i-1]));
    double dy = ipY[i];

    double x   =                                      dx;
    double d1x =     ax * s3 +     bx * s2 + cx * s;
    double d2x = 6 * ax * s3 + 2 * bx * s2;
    double d3x = 6 * ax * s3;

    double y   =                                      dy;
    double d1y =     ay * s3 +     by * s2 + cy * s;
    double d2y = 6 * ay * s3 + 2 * by * s2;
    double d3y = 6 * ay * s3;

    ChangeDrawStyle(FRAME);
	if(MoveToEx(dcActive, x, y, NULL) != TRUE) 
		error(SYSTEM, "Failed to MoveToEx in DrawCatmullRomSpline!");	        	    		    
	  
    for(int j = 1; j <= n; j++) {
      x += d1x;  d1x += d2x; d2x += d3x;
      y += d1y;  d1y += d2y; d2y += d3y;

	  if(LineTo(dcActive, x, y) != TRUE) 
    	error(SYSTEM, "Failed to draw in DrawCatmullRomSpline!");	
    }
  }    
	RestoreDrawStyle();    
}


void window::DrawString(const int iX, const int iY, const char *cpText) {

    if (cpText == NULL) {
	    error(USER, "Tried passing NULL string to DrawString!");
		return;
	}

    ProcessMessage(); // Kludge

	SetFontStyle();
	    
	if(SetBkMode(dcActive, TRANSPARENT) == 0) {
        error(SYSTEM, "Failed to SetBkMode in DrawString!");	        	    	
	}
	if(SetTextAlign(dcActive, TA_UPDATECP) == GDI_ERROR) {
        error(SYSTEM, "Failed to SetTextAlign in DrawString!");   
	}
	
	if(MoveToEx(dcActive, iX, iY, NULL) != TRUE) {
        error(SYSTEM, "Failed to MoveToEx in DrawString!");	        	    	
    }

	if(TextOut(dcActive, iX, iY, cpText, static_cast<int>(strlen(cpText))) == 0) {
        error(SYSTEM, "Failed to TextOut in DrawString!");	        	    	
	}
	RestoreFontStyle();

}

void window::DrawString(const int iX, const int iY, const string strText) {

    DrawString(iX, iY, static_cast<const char *>(strText.c_str()));

}

void window::DrawInteger(const int iX, const int iY, const long lNumber) {
    
	char cTmpStorage[128];
	sprintf(cTmpStorage, "%d", lNumber);
    DrawString(iX, iY, cTmpStorage);
}

void window::DrawDouble(const int iX, const int iY, const double dNumber) {

	char cTmpStorage[128];
	sprintf(cTmpStorage, "%f", dNumber);
	
    DrawString(iX, iY, cTmpStorage);
}

void window::GetStringSize(int &iWidth, int &iHeight, const char* cpText) {

    SIZE szTemp;

    ProcessMessage(); // Kludge

    SetFontStyle();
    if(GetTextExtentPoint32(dcActive, cpText, static_cast<int>(strlen(cpText)), &szTemp) != TRUE) {
        error(SYSTEM, "Failed to GetTextExtentPoint32 in GetStringSize!");	        	    
    }
    RestoreFontStyle();

    iWidth = szTemp.cx;
    iHeight = szTemp.cy;

}

void window::GetStringSize(int &iWidth, int &iHeight, const string strText) {

    GetStringSize(iWidth, iHeight, static_cast<const char *>(strText.c_str()));

}

void window::GetIntegerSize(int &iWidth, int &iHeight, const long lNumber) {

	char cTmpStorage[128];
	sprintf(cTmpStorage, "%d", lNumber);
    GetStringSize(iWidth, iHeight, cTmpStorage);

}

void window::GetDoubleSize(int &iWidth, int &iHeight, const double dNumber) {

	char cTmpStorage[128];
	sprintf(cTmpStorage, "%f", dNumber);
	
    GetStringSize(iWidth, iHeight, cTmpStorage);

}


void window::DrawImage(const image *imgThis, 
                       const int iX, 
                       const int iY, 
                       const int iWidth, 
                       const int iHeight) {

    ProcessMessage(); // Kludge
    
    if(imgThis->usWidth != 0 && imgThis->usHeight != 0) {
    
	    BITMAPINFO *bmiImage = (LPBITMAPINFO)(new BYTE[sizeof(BITMAPINFOHEADER)]);
    
		if(bmiImage == NULL) {
    	  error(OUT_OF_MEMORY, "Could not allocated temporary storage in DrawImage!");
		}

		memset(bmiImage, 0, sizeof(BITMAPINFOHEADER));
	
		bmiImage->bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
		bmiImage->bmiHeader.biPlanes = 1;
		bmiImage->bmiHeader.biBitCount = 32;
		bmiImage->bmiHeader.biCompression = BI_RGB;
		bmiImage->bmiHeader.biSizeImage = 0;
		bmiImage->bmiHeader.biClrUsed = 0;
		bmiImage->bmiHeader.biClrImportant = 0;
	
	    bmiImage->bmiHeader.biWidth = imgThis->usWidth;
		bmiImage->bmiHeader.biHeight = -imgThis->usHeight;	

	  if((imgThis->itType == JPEG) || (imgThis->itType == SCREEN)) {

		if((iWidth != -1) && (iHeight != -1)) {
			if(StretchDIBits(dcActive, 
			                 iX, 
			                 iY, 
			                 iWidth, 
			                 iHeight, 
			                 0, 
			                 0, 
			                 imgThis->usWidth, 
			                 imgThis->usHeight, 
			                 imgThis->ucpImageData, 
			                 bmiImage, 
			                 DIB_RGB_COLORS, 
			                 SRCCOPY) == GDI_ERROR) {
 	            error(SYSTEM, "Failed to StretchDIBits in DrawImage!");
			}
		} else {
	        if(SetDIBitsToDevice(dcActive, 
	                             iX, 
	                             iY, 
	                             imgThis->usWidth, 
	                             imgThis->usHeight, 
	                             0, 
	                             0, 
	                             0, 
	                             imgThis->usHeight, 
	                             imgThis->ucpImageData, 
	                             bmiImage, 
	                             DIB_RGB_COLORS) == 0) {
 	            error(SYSTEM, "Failed to SetDIBitsToDevice in DrawImage!");
	        }
		}

	  } else if(imgThis->itType == PNG) {

		if((iWidth != -1) && (iHeight != -1)) {
			if(StretchDIBits(dcActive, 
			                 iX, 
			                 iY, 
			                 iWidth, 
			                 iHeight, 
			                 0, 
			                 0, 
			                 imgThis->usWidth, 
			                 imgThis->usHeight, 
			                 imgThis->ucpImageData, 
			                 bmiImage, 
			                 DIB_RGB_COLORS, 
			                 SRCCOPY) == GDI_ERROR) {
 	            error(SYSTEM, "Failed to StretchDIBits in DrawImage!");
			}
		} else {
		
          unsigned char *ucpTemp = new unsigned char[(imgThis->usWidth * 4) * imgThis->usHeight];
	      if(ucpTemp == NULL) {
      		  error(OUT_OF_MEMORY, "Creating image storage space in DrawImage!");
	      }

	      HDC dcTempBuffer = CreateCompatibleDC(dcActive);
		  HBITMAP bmapTempBuffer = CreateCompatibleBitmap(dcActive, imgThis->usWidth, imgThis->usHeight);

	      HBITMAP bmapOld = static_cast<HBITMAP>(SelectObject(dcTempBuffer, bmapTempBuffer));

		  if(BitBlt(dcTempBuffer, 0, 0, static_cast<int>(imgThis->usWidth), static_cast<int>(imgThis->usHeight), dcActive, static_cast<int>(iX), static_cast<int>(iY), SRCCOPY) != TRUE) {
        	error(SYSTEM, "Failed to BitBlt in DrawImage!");	
		  }

		  if(GetDIBits(dcActive, bmapTempBuffer, 0, imgThis->usHeight, ucpTemp, bmiImage, DIB_RGB_COLORS) == 0) {
        	error(SYSTEM, "Failed to GetDIBits in DrawImage!");
	 	  }

	      SelectObject(dcTempBuffer, bmapOld);
    	  if(DeleteObject(bmapTempBuffer) != TRUE) {
	    	error(SYSTEM, "Failed to delete bmapTempBuffer in DrawImage!");    
	      }
	      
		  if(DeleteDC(dcTempBuffer) != TRUE) {
	    	error(SYSTEM, "Failed to delete dcTempBuffer in DrawImage!");
		  }
		
		  for(unsigned long i = 0; i < ((imgThis->usWidth * 4) * imgThis->usHeight); i+=4) {
		    int alpha = imgThis->ucpImageData[i+3];
		    int invalpha = 255 - alpha; 
		    ucpTemp[i] = (ucpTemp[i] * invalpha + imgThis->ucpImageData[i] * alpha) >> 8; 
		    ucpTemp[i+1] = (ucpTemp[i+1] * invalpha + imgThis->ucpImageData[i+1] * alpha) >> 8; 
		    ucpTemp[i+2] = (ucpTemp[i+2] * invalpha + imgThis->ucpImageData[i+2] * alpha) >> 8; 
		  }
		
	      if(SetDIBitsToDevice(dcActive, 
	                             iX, 
	                             iY, 
	                             imgThis->usWidth, 
	                             imgThis->usHeight, 
	                             0, 
	                             0, 
	                             0, 
	                             imgThis->usHeight, 
	                             ucpTemp, 
	                             bmiImage, 
	                             DIB_RGB_COLORS) == 0) {
 	            error(SYSTEM, "Failed to SetDIBitsToDevice in DrawImage!");
	        }
	        
	      delete [] ucpTemp;
	      
		}
	
	  } else {
        error(USER, "Unsupported image type in DrawImage!");
	  }
	  
	  delete [] bmiImage;
	}
}

void window::DrawImage(const image &imgThis, 
                       const int iX, 
                       const int iY, 
                       const int iWidth, 
                       const int iHeight) {

  DrawImage(&imgThis, iX, iY, iWidth, iHeight);

}

color window::GetColor(const int iX, const int iY) {

    char caImageData[4];

	BITMAPINFO *bmiImage = (LPBITMAPINFO) new BYTE[sizeof(BITMAPINFOHEADER)];
	if(bmiImage == NULL) {
        error(OUT_OF_MEMORY, "Creating bitmap in GetColor!");
	}
	
	memset(bmiImage, 0, sizeof(BITMAPINFOHEADER));

    bmiImage->bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
	bmiImage->bmiHeader.biPlanes = 1;
	bmiImage->bmiHeader.biBitCount = 32;
	bmiImage->bmiHeader.biCompression = BI_RGB;
	bmiImage->bmiHeader.biSizeImage = 0;
	bmiImage->bmiHeader.biClrUsed = 0;
	bmiImage->bmiHeader.biClrImportant = 0;
	bmiImage->bmiHeader.biWidth = 1;
	bmiImage->bmiHeader.biHeight = -1;

    HDC dcTempBuffer = CreateCompatibleDC(dcActive);
	HBITMAP bmapTempBuffer = CreateCompatibleBitmap(dcActive, 1, 1);

    HBITMAP bmapOld = static_cast<HBITMAP>(SelectObject(dcTempBuffer, bmapTempBuffer));

    ProcessMessage(); // Kludge
    
	if(BitBlt(dcTempBuffer, 0, 0, 1, 1, dcActive, iX, iY, SRCCOPY) != TRUE) {
	    error(SYSTEM, "Failed to BltBit in GetColor!");
    }

	if(GetDIBits(dcActive, bmapTempBuffer, 0, 1, caImageData, bmiImage, DIB_RGB_COLORS) == 0) {
        error(SYSTEM, "Failed to GetDIBits in GetColor!");	    
	}

    color colTemp(static_cast<unsigned char>(caImageData[2]),
                  static_cast<unsigned char>(caImageData[1]),
                  static_cast<unsigned char>(caImageData[0]));

    SelectObject(dcTempBuffer, bmapOld);
    if(DeleteObject(bmapTempBuffer) != TRUE) {
	    error(SYSTEM, "Failed to delete bmapTempBuffer in GetColor!");
    }
	if(DeleteDC(dcTempBuffer) != TRUE) {
	    error(SYSTEM, "Failed to delete dcTempBuffer in GetColor!");
	}
	delete [] bmiImage;
	
	return colTemp;

}


void window::GetColor(const int iX, const int iY, double &dRed, double &dGreen, double &dBlue) {

  color colTemp = GetColor(iX, iY);
  
  dRed = (colTemp.ucRed / 255.0);
  dGreen = (colTemp.ucGreen / 255.0);
  dBlue = (colTemp.ucBlue / 255.0);

}


double window::GetRed(const int iX, const int iY) {

  color colTemp = GetColor(iX, iY);
  
  return (colTemp.ucRed / 255.0);
  
}

double window::GetGreen(const int iX, const int iY) {

  color colTemp = GetColor(iX, iY);
  
  return (colTemp.ucGreen / 255.0);

}

double window::GetBlue(const int iX, const int iY) {

  color colTemp = GetColor(iX, iY);
  
  return (colTemp.ucBlue / 255.0);

}


void window::StoreImage(image *imgThis, const unsigned usX, const unsigned short usY, const unsigned short usWidth, const unsigned short usHeight) {

    ProcessMessage(); // Kludge    

    if((usX + usWidth > iWindowWidth) || (usY + usHeight > iWindowHeight)) {
        error(USER, "StoreImage selection extends outside the window!");
        return;
    }
    
    imgThis->usWidth = usWidth;
	imgThis->usHeight = usHeight;
    
    BITMAPINFO *bmiImage = (LPBITMAPINFO)(new BYTE[sizeof(BITMAPINFOHEADER)]);
	if(bmiImage == NULL) {
        error(OUT_OF_MEMORY, "Creating BITMAPINFOHEADER in StoreImage!");
	}

    memset(bmiImage, 0, sizeof(BITMAPINFOHEADER));
    
    imgThis->itType = SCREEN;
    
    bmiImage->bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
	bmiImage->bmiHeader.biPlanes = 1;
	bmiImage->bmiHeader.biBitCount = 32;
	bmiImage->bmiHeader.biCompression = BI_RGB;
	bmiImage->bmiHeader.biSizeImage = 0;
	bmiImage->bmiHeader.biClrUsed = 0;
	bmiImage->bmiHeader.biClrImportant = 0;
	bmiImage->bmiHeader.biWidth = usWidth;
	bmiImage->bmiHeader.biHeight = -usHeight;

	if(imgThis->ucpImageData != NULL) {
		delete [] imgThis->ucpImageData;
	}

	imgThis->ucpImageData = new unsigned char[(usWidth * 4) * usHeight];
    if(imgThis->ucpImageData == NULL) {
        error(OUT_OF_MEMORY, "Creating image storage space in StoreImage!");
    }

    HDC dcTempBuffer = CreateCompatibleDC(dcActive);
	HBITMAP bmapTempBuffer = CreateCompatibleBitmap(dcActive, usWidth, usHeight);

    HBITMAP bmapOld = static_cast<HBITMAP>(SelectObject(dcTempBuffer, bmapTempBuffer));

	if(BitBlt(dcTempBuffer, 0, 0, static_cast<int>(usWidth), static_cast<int>(usHeight), dcActive, static_cast<int>(usX), static_cast<int>(usY), SRCCOPY) != TRUE) {
        error(SYSTEM, "Failed to BitBlt in StoreImage!");	
	}

	if(GetDIBits(dcActive, bmapTempBuffer, 0, usHeight, imgThis->ucpImageData, bmiImage, DIB_RGB_COLORS) == 0) {
        error(SYSTEM, "Failed to GetDIBits in StoreImage!");
	}

    SelectObject(dcTempBuffer, bmapOld);
    if(DeleteObject(bmapTempBuffer) != TRUE) {
	    error(SYSTEM, "Failed to delete bmapTempBuffer in StoreImage!");    
    }
	if(DeleteDC(dcTempBuffer) != TRUE) {
	    error(SYSTEM, "Failed to delete dcTempBuffer in StoreImage!");
	}

}

void window::StoreImage(image &imgThis, const unsigned usX, const unsigned short usY, const unsigned short usWidth, const unsigned short usHeight) {
	StoreImage(&imgThis, usX, usY, usWidth, usHeight);

}


void window::SetMouseState(const HWND hwndKey, const button btMouse, const buttonstate bsNew, const int iX, const int iY) {
    
    window* windTmp = (*mapWindow)[hwndKey];
    
	if(btMouse == LEFT_BUTTON) {
  		windTmp->bsLeft = bsNew;
 	 } else {
  		windTmp->bsRight = bsNew;  	    
  	}
  	  
	windTmp->iMouseX = iX;
	windTmp->iMouseY = iY;

}

void window::SetMouseCoord(const HWND hwndKey, const int iX, const int iY) {

    window* windTmp = (*mapWindow)[hwndKey];

	windTmp->iMouseX = iX;
	windTmp->iMouseY = iY;

}

void window::SetClickInfo(const HWND hwndKey, const clicktype ctInfo, const int iX, const int iY) {

    window* windTmp = (*mapWindow)[hwndKey];
	pair<clicktype, pair<int, int> > temp;

	temp.first = ctInfo;
	temp.second.first = iX;
	temp.second.second = iY;
	
	windTmp->queMInput.push(temp);

}

void window::SetKeyInfo(const HWND hwndKey, const keytype ktInfo, const char cValue) {

    window* windTmp = (*mapWindow)[hwndKey];
    
    pair<keytype, char> temp;
    
    temp.first = ktInfo;
	temp.second = cValue;
	
	windTmp->queKInput.push(temp);
}