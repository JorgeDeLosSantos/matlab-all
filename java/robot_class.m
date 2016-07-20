clear;clc;
import java.awt.Robot;
import java.awt.event.KeyEvent;

rb = Robot();
% 
for x = 1:10
rb.keyPress(KeyEvent.VK_A);
rb.keyRelease(KeyEvent.VK_A);
end