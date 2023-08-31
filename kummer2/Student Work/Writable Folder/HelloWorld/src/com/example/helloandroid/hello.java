package com.example.helloandroid;
import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;
public class hello extends Activity {   
	@Override   
	public void onCreate(Bundle savedInstanceState) {       
		super.onCreate(savedInstanceState);       
		TextView tv = new TextView(this);       
		tv.setText("Hello, Kevin");       
		setContentView(tv);   
	}
}
