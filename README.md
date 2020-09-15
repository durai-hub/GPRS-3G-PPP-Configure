# PPP Configure for Embedded Linux Platfrom - 32 Bit ARM


 /***********************************************************************************************************

 The following steps for compile and configure the PPP(Point to point Protocol) for 32 bit Embedded Platform
  * Host platform - Ubuntu 16.04
  * Target Platform - TI Am335x  Eval Board
  * Network Platform - Ublox 3G Modem for  
************************************************************************************************************/

#Step 1: 

Download the PPP from here,

http://samba.org/ftp/ppp/ppp-2.4.4.tar.gz or Find the tar ball in Archive folder 


#Step 2: 

Configure the PPP 

./configure --target=arm-linux --enable-arm --prefix=/usr/local/arm/3.3.2/arm-linux/ make CC=/usr/local/arm/3.3.2/bin/arm-linux-gcc make DESTDIR=`pwd`/../ppp_struct install



#Step 3: 

Compile the PPP in host with cross compilation tool  

export CROSS_COMPILE=arm-linux-gnueabihf-gc
export ARCH=arm
export PATH=/home/Durai/ti-sdk-am335x-evm-06.00.00.00/linux-devkit/sysroots/i686-arago-linux/usr/bin:$PATH
make 

Afte successfully compile two binary will be generated 

pppd in /pppd dir
chat in /chat dir


#Step 4: 

Copy the pppd and chat into target board rootfs /usr/sbin and change the permission with chmod 777 pppd chat 
copy the pon and poff from /script to target board rootfs /usr/sbin 

#step 5: 

copy the ppp dir from /SDcardBackup/PPP/ to rootfs /etc 

#step 6: 

in board linux prompt do the following action 

root@am335x-evm://# pon 

wait for sometime and check modem is conected by using ifconfig

root@am335x-evm://# ifconfig                                                    
eth0      Link encap:Ethernet  HWaddr 00:18:31:E2:58:6C                         
          UP BROADCAST ALLMULTI MULTICAST  MTU:1500  Metric:1                   
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0                    
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0                  
          collisions:0 txqueuelen:1000                                          
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)                                
                                                                                
lo        Link encap:Local Loopback                                             
          inet addr:127.0.0.1  Mask:255.0.0.0                                   
          UP LOOPBACK RUNNING  MTU:16436  Metric:1                              
          RX packets:8 errors:0 dropped:0 overruns:0 frame:0                    
          TX packets:8 errors:0 dropped:0 overruns:0 carrier:0                  
          collisions:0 txqueuelen:0                                             
          RX bytes:560 (560.0 B)  TX bytes:560 (560.0 B)                        
                                                                                
ppp0      Link encap:Point-to-Point Protocol                                    
          inet addr:100.74.8.109  P-t-P:100.74.8.109  Mask:255.255.255.255      
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1            
          RX packets:5 errors:0 dropped:0 overruns:0 frame:0                    
          TX packets:7 errors:0 dropped:0 overruns:0 carrier:0                  
          collisions:0 txqueuelen:3                                             
          RX bytes:44 (44.0 B)  TX bytes:87 (87.0 B)  


Check the ppp0 was populated with ip address

#Step 7: 

Add the ppp ip into kernel route map 
root@am335x-evm://# ip route add 100.74.8.109 dev ppp0 
root@am335x-evm://# route add default gw 100.74.8.109 ppp0

#Step 8: 

The PPP0 should be added to route table and as default 

root@am335x-evm://# route                                                       
Kernel IP routing table                                                         
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface   
default         100.74.8.109    0.0.0.0         UG    0      0        0 ppp0    
100.74.8.109    *               255.255.255.255 UH    0      0        0 ppp0 



#Step 9: 

Ping the WWW.google.com or google ip address 
root@am335x-evm://# ping 173.194.70.147


