from pydevd_additional_thread_info import PyDBAdditionalThreadInfoWithoutCurrentFramesSupport
from pydevd_constants import Null


import unittest

#=======================================================================================================================
# TestCase
#=======================================================================================================================
class TestCase(unittest.TestCase):
    '''
        Used for profiling the PyDBAdditionalThreadInfoWithoutCurrentFramesSupport version
    '''
    
    def testMetNoFramesSupport(self):
        info = PyDBAdditionalThreadInfoWithoutCurrentFramesSupport()
        
        mainDebugger = Null()
        filename = ''
        base = ''
        additionalInfo = Null()
        t = Null()
        frame = Null()
        
        times = 10
        for i in range(times):
            info.CreateDbFrame(mainDebugger, filename, base, additionalInfo, t, frame)
            
        #we haven't kept any reference, so, they must have been gargage-collected already!
        self.assertEqual(0, len(info.IterFrames()))
        
        kept_frames = []
        for i in range(times):
            kept_frames.append(info.CreateDbFrame(mainDebugger, filename, base, additionalInfo, t, frame))
        
        for i in range(times):
            self.assertEqual(times, len(info.IterFrames()))

#=======================================================================================================================
# main        
#=======================================================================================================================
if __name__ == '__main__':
    unittest.main()