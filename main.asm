include irvine32.inc


.data
grid1 byte "FASTXSZSPOTHCXEUPOAXXCAUMYCHLTAPPLEF",0
grid2 byte "BXYLMDBYXCDXSOECZAVALUEMMLOYTSCEPXPACASCVLYQCLAWEIONSCZMSSRYWZEXAMSUEVRPMBCYSEUTT",0
grid3 byte
"BAXOMDLCWYZMDACCZWMXVYXAXWOOMONEYYZNBABRESOURCEALLOONFXYMNOGRLGFINANCEXEXEBREWARDXYMLTRANI  NGRABEGYUMOVVWOMLNXYRGRGMABOLTGLMNOPQRLDEXYENGINEERING",0


instructions1 byte "CONSIDER THE FOLLOWING INSTRUCTIONS TO AVOID LOSING LIVES ",0ah byte"1-DONOT ENTER WORDS IN LOWERCASE ",0ah
byte"2-DONOT ENTER REPEATED WORDS",0ah byte "3-DONOT ENTER INVALID WORDS",0ah
byte"	",0ah
byte"TO CLEAR LEVEL1 YOU NEED TO ENTER 6 CORRECT WORDS",0ah byte"TO CLEAR LEVEL2 YOU NEED TO ENTER 6 CORRECT WORDS",0ah byte"TO CLEAR LEVEL3 YOU NEED TO ENTER 8 CORRECT WORDS",0ah
byte "	",0ah byte"BEST OF LUCK!",0

instructions2 byte "ENTER 1 TO PLAY ",0ah byte"ENTER 2 TO QUIT",0

usermsg1 byte "1- Quick Play",0ah byte "2- Settings",0ah
byte "3- Instructions",0ah byte"4- Quit",0

usermsg4 byte "Enter a word : ",0 choice byte "Enter a Choice : ",0

lives byte "Lives : ",0
score byte "	Score : ",0 space byte " ",0
 
count dword 0
live dword 0
points dword 0
points1 dword 0
points2 dword 0
Msg1 byte "	LEVEL 1 ",0
Msg2 byte "	LEVEL 2 ",0
Msg3 byte "	LEVEL 3 ",0


level byte "Select Level ",0ah byte " ",0ah
byte "1-Easy",0ah
byte "2-Medium",0ah byte "3-Hard ",0

arr byte 6 dup(-1) arr1 byte 6 dup(-1)
arr2 byte 10 dup(-1)
again byte "Word is Repeated",0


string byte 10 dup(?)


found byte "Word Found ",0
notfound byte "Word not found",0


lost byte "***************GAME OVER***************",0ah byte"	BETTER LUCK NEXT TIME :)	",0

start byte "***************WELCOME TO THE WORLD OF WORDS: DIVE INTO OUR CHALLENGING CROSSWORD PUZZLE!***************",0


score1 byte "Your Score is : ",0


win byte "Congratulations! YOU WON",0
 
colours byte " 1-Blue",0dh,0ah byte" 2-White",0dh,0ah
byte" 3-Green",0dh,0ah byte" 4-Red",0dh,0ah
byte" 5-Magenta",0dh,0ah byte" 6-Yellow",0dh,0ah
byte" 7-Cyan",0dh,0ah byte" 8-Brown",0dh,0ah byte"Select Color:",0

;words of grid1 FAST byte "FAST",0
APPLE byte "APPLE",0 SPOT BYTE "SPOT",0 TOUCH BYTE "TOUCH",0 SHOUT BYTE "SHOUT",0 POT BYTE "POT",0

;Words of grid2
VALUE BYTE "VALUE",0 EMPLOYEE BYTE "EMPLOYEE",0 SUCCESS BYTE "SUCCESS",0 LAW BYTE "LAW",0
VIRUS BYTE "VIRUS",0 DATA BYTE "DATA",0

;Words of grid3


FINANCE BYTE "FINANCE",0 MONEY BYTE "MONEY",0 REWARD BYTE "REWARD",0 WALLET BYTE "WALLET",0 WARE BYTE "WARE",0
MANAGEMENT BYTE "MANAGEMENT",0
 
ENGINEERING BYTE "ENGINEERING",0 RESOURCE BYTE "RESOURCE",0
MEN BYTE "MEN",0 GRAB BYTE "GRAB",0





.code
main proc call crlf
call crlf
mov eax,cyan call settextcolor
mov edx,offset start call writestring
call crlf call crlf
mov edx,offset usermsg1 call writestring
call crlf


mov edx,offset choice call writestring
call readdec call clrscr

cmp eax,1
je callQuickplay


cmp eax,2
je callSetting


cmp eax,3
je callInstructions
 
cmp eax,4 je callQuit





callQuickplay:


call Quickplay jmp callQuit

callSetting:
call Setting jmp callQuit

callInstructions:
call Instructions jmp callQuit

callQuit:
exit
main endp
;Main Function ends here


QuickPlay proc


call clrscr mov points,0 mov points1,0 mov points2,0

mov edx,offset level call writestring
call crlf
 
mov edx,offset choice call writestring
call readdec


cmp eax,1 je level1 cmp eax,2 je level2
cmp eax,3 je level3



Level1 :


call clrscr call crlf mov live,3
mov points,0


top:


cmp live,0 je lost1
cmp points,6 je Level2

mov edx,offset lives call writestring
mov eax,live call writedec
mov edx,offset score call writestring
mov eax,points call writedec
 
call crlf call crlf
mov edx,offset msg1 call writestring
call crlf call crlf
mov ecx,lengthof grid1 mov esi,0
mov count,0


L1:


mov al,grid1[esi*type grid1] call writechar
mov edx,offset space call writestring
mov edx,offset space call writestring
inc esi inc count
cmp count,6
je linechange1 jmp next1

linechange1:
call crlf
mov count ,0


next1:


Loop L1 call crlf
;above code for grid1 printing
 
mov ecx,10
mov edx,offset usermsg4 call writestring
mov edx,offset string call readstring

invoke str_compare , addr string , addr SPOT je	Spot1
invoke str_compare , addr string , addr FAST je Fast1
invoke str_compare , addr string , addr APPLE je Apple1
invoke str_compare , addr string , addr TOUCH je Touch1
invoke str_compare , addr string , addr SHOUT je Shout1
invoke str_compare , addr string , addr POT je Pot1

jmp nf




Spot1:
cmp arr[0],-1 je fspot
jmp repeated


Fast1:
cmp arr[1],-1 je ffast
jmp repeated


Apple1:
 
cmp arr[2],-1 je fapple
jmp repeated


Touch1:
cmp arr[3],-1 je ftouch
jmp repeated


Shout1:
cmp arr[4],-1 je fshout
jmp repeated


Pot1:
cmp arr[5],-1 je fpot
jmp repeated






fspot:
mov arr[0],1
mov edx,offset found call writestring
inc points call crlf
mov eax,500 call delay
call clrscr jmp top

ffast:
mov arr[1],1
 
mov edx,offset found call writestring
inc points call crlf
mov eax,5000 call delay
call clrscr jmp top

ftouch:
mov arr[3],1
mov edx,offset found call writestring
inc points call crlf
mov eax,500 call delay
call clrscr jmp top

fpot:
mov arr[5],1
mov edx,offset found call writestring
inc points call crlf
mov eax,500 call delay
call clrscr jmp top

fshout:
mov arr[4],1
mov edx,offset found
 
call writestring inc points
call crlf
mov eax,500 call delay
call clrscr jmp top

fapple:
mov arr[2],1
mov edx,offset found call writestring
inc points call crlf
mov eax,500 call delay
call clrscr jmp top



repeated:
dec live
mov edx,offset again call writestring
mov eax,5000 call delay
call clrscr jmp top



nf:
mov edx,offset notfound call writestring
dec live
 
mov eax,5000 call delay
call clrscr jmp top





Level2 :
call clrscr call crlf mov live,3
mov points1,0


top1:


cmp live,0 je lost1
cmp points1,6 je Level3

mov edx,offset lives call writestring
mov eax,live call writedec
mov edx,offset score call writestring
mov eax,points call writedec
call crlf call crlf

mov edx,offset msg2 call writestring
call crlf
 
call crlf


mov count,0
mov ecx,lengthof grid2


mov esi,0


L2:
mov al,grid2[esi*type grid2] call writechar
mov edx,offset space call writestring
mov edx,offset space call writestring
inc esi inc count
cmp count,9
je linechange2 jmp next2 linechange2:
call crlf
mov count ,0 next2:
Loop L2 call crlf
;above code for grid2 printing


mov ecx,10
mov edx,offset usermsg4 call writestring
mov edx,offset string call readstring

invoke str_compare , addr string , addr VALUE
 
je	Value1
invoke str_compare , addr string , addr EMPLOYEE je Employee1
invoke str_compare , addr string , addr SUCCESS je Success1
invoke str_compare , addr string , addr LAW je Law1
invoke str_compare , addr string , addr VIRUS je Virus1
invoke str_compare , addr string , addr DATA je Data1

jmp nf1




Value1:
cmp arr1[0],-1 je fvalue
jmp repeated1


Employee1:
cmp arr1[1],-1 je femployee
jmp repeated1


Success1:
cmp arr1[2],-1 je fsuccess
jmp repeated1


Law1:
cmp arr1[3],-1 je fLaw
jmp repeated1
 
Virus1:
cmp arr1[4],-1 je fvirus
jmp repeated1


Data1:
cmp arr1[5],-1 je fdata
jmp repeated1




fvalue:
mov arr1[0],1
mov edx,offset found call writestring
inc points inc points1 call crlf
mov eax,50000 call delay
call clrscr jmp top1

femployee:
mov arr1[1],1
mov edx,offset found call writestring
inc points inc points1 call crlf
mov eax,500 call delay
call clrscr
 
jmp top1


fsuccess:
mov arr1[2],1
mov edx,offset found call writestring
inc points inc points1 call crlf
mov eax,500 call delay
call clrscr jmp top1

fLaw:
mov arr1[3],1
mov edx,offset found call writestring
inc points inc points1 call crlf
mov eax,500 call delay
call clrscr jmp top1

fvirus:
mov arr1[4],1
mov edx,offset found call writestring
inc points inc points1 call crlf
mov eax,500
 
call delay call clrscr jmp top1

fdata:
mov arr1[5],1
mov edx,offset found call writestring
inc points inc points1 call crlf
mov eax,500 call delay
call clrscr jmp top1



repeated1:
dec live
mov edx,offset again call writestring
mov eax,500 call delay
call clrscr jmp top1



nf1:
mov edx,offset notfound call writestring
dec live
mov eax,500 call delay
call clrscr
 
jmp top1




level3:


call clrscr call crlf mov live,3
mov points2,0


top2:


cmp live,0 je lost1
cmp points2,8 je Win1

mov edx,offset lives call writestring
mov eax,live call writedec
mov edx,offset score call writestring
mov eax,points call writedec
call crlf call crlf

mov edx,offset msg3 call writestring
call crlf call crlf

mov count,0
 
mov ecx,lengthof grid3


mov esi,0


L3:


mov al,grid3[esi*type grid3] call writechar
mov edx,offset space call writestring
mov edx,offset space call writestring
inc esi inc count
cmp count,12 je linechange3 jmp next3

linechange3:
call crlf
mov count ,0


next3:


Loop L3 call crlf
;above code for grid3 printing


mov ecx,15
mov edx,offset usermsg4 call writestring
mov edx,offset string call readstring
 
invoke str_compare , addr string , addr FINANCE je	Finance1
invoke str_compare , addr string , addr MONEY je Money1
invoke str_compare , addr string , addr REWARD je Reward1
invoke str_compare , addr string , addr WALLET je Wallet1
invoke str_compare , addr string , addr WARE je Ware1
invoke str_compare , addr string , addr MANAGEMENT je Management1
invoke str_compare , addr string , addr ENGINEERING je Engineering1
invoke str_compare , addr string , addr RESOURCE je Resource1
invoke str_compare , addr string , addr MEN je MEN1
invoke str_compare , addr string , addr GRAB je Grab1

jmp nf2




Finance1:
cmp arr2[0],-1 je ffinance
jmp repeated2


Money1:
cmp arr2[1],-1 je fmoney
jmp repeated2
 
Reward1:
cmp arr2[2],-1 je freward
jmp repeated2


Wallet1:
cmp arr2[3],-1 je fwallet
jmp repeated2


Ware1:
cmp arr2[4],-1 je fware
jmp repeated2


Management1: cmp arr2[5],-1
je fmanagement jmp repeated2

Engineering1: cmp arr2[6],-1 je fengineering jmp repeated2

Resource1:
cmp arr2[7],-1 je fresource
jmp repeated2


Men1:
cmp arr2[8],-1 je fmen
jmp repeated2
 
Grab1:
cmp arr2[9],-1 je fgrab
jmp repeated2


ffinance:
mov arr2[0],1
mov edx,offset found call writestring
inc points inc points2 call crlf
mov eax,500 call delay
call clrscr jmp top2

fmoney:
mov arr2[1],1
mov edx,offset found call writestring
inc points inc points2 call crlf
mov eax,500 call delay
call clrscr jmp top2

freward:
mov arr2[2],1
mov edx,offset found call writestring
 
inc points inc points2 call crlf
mov eax,5000 call delay
call clrscr jmp top2

fwallet:
mov arr2[3],1
mov edx,offset found call writestring
inc points inc points2 call crlf
mov eax,500 call delay
call clrscr jmp top2

fware:
mov arr2[4],1
mov edx,offset found call writestring
inc points inc points2 call crlf
mov eax,500 call delay
call clrscr jmp top2

fmanagement: mov arr2[5],1
 
mov edx,offset found call writestring
inc points inc points2 call crlf
mov eax,500 call delay
call clrscr jmp top2

fengineering: mov arr2[6],1
mov edx,offset found call writestring
inc points inc points2 call crlf
mov eax,500 call delay
call clrscr jmp top2



fresource:
mov arr2[7],1
mov edx,offset found call writestring
inc points inc points2 call crlf
mov eax,500 call delay
call clrscr jmp top2
 

fmen:
mov arr2[8],1
mov edx,offset found call writestring
inc points inc points2 call crlf
mov eax,500 call delay
call clrscr jmp top2



fgrab:
mov arr2[9],1
mov edx,offset found call writestring
inc points inc points2 call crlf
mov eax,500 call delay
call clrscr jmp top2

repeated2:
dec live
mov edx,offset again call writestring
mov eax,500 call delay
call clrscr
 
jmp top2




nf2:
mov edx,offset notfound call writestring
dec live
mov eax,500 call delay
call clrscr jmp top2

lost1:
call crlf call crlf
mov edx,offset score1 call writestring
mov eax,points call writedec
call crlf call crlf
mov edx,offset lost call writestring
jmp quit


Win1:
call crlf call crlf
mov edx,offset score1 call writestring
mov eax,points call writedec
call crlf call crlf
 
mov edx,offset win call writestring

quit :
exit
Quickplay endp


Setting proc call clrscr
mov edx,offset colours call writestring
mov eax,0
call readdec


cmp al,1 jne next
mov eax,blue
call settextcolor jmp quit1

next:
cmp al,2 jne next1
mov eax,white call settextcolor jmp quit1

next1:
cmp al,3 jne next2
mov eax,green call settextcolor jmp quit1
 
next2:
cmp al,4 jne next3
mov eax,red
call settextcolor jmp quit1

next3:
cmp al,5 jne next4
mov eax,magenta call settextcolor
jmp quit1


next4:
cmp al,6 jne next5
mov eax,yellow call settextcolor jmp quit1

next5:
cmp al,7 jne next6
mov eax,cyan call settextcolor jmp quit1

next6:
cmp al,8 jne quit
mov eax,brown call settextcolor jmp quit1
 
quit1:


call Quickplay exit
Setting endp Instructions proc
mov eax,cyan+(black*16) call settextcolor
mov edx,offset instructions1 call writestring
call crlf call crlf
mov edx,offset instructions2 call writestring
call crlf call crlf
mov edx,offset choice call writestring
call readdec cmp eax,1
je quickplay1 jmp quit quickplay1:
call quickplay quit:
exit
Instructions endp Quit proc
exit
Quit endp end main
 
