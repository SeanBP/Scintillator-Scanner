import serial
import sys
#from pynput.keyboard import Key, Controller
ser = serial.Serial('/dev/ttyACM0',baudrate = 9600, timeout = 1)
if ser.is_open == 0:
	print("not open")
	ser.open()
num1 = sys.argv[1]

num2 = input()
#print(num2)
#keyboard = Controller()
#key = "a"
#keyboard.press(key)
#keyboard.release(key)
#keyboard.press(Key.enter)
#keyboard.release(Key.enter)

#print('this is the argument you gave me ', num)

ser.write(num1.encode('utf-8'))
#print(type(num))

