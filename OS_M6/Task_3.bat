::3.1
net start > "C:\LAB6\LaunchedServices.txt"

::3.2.1
net stop DNS-client

::3.2.2
net start > "C:\LAB6\launchedServicesAfter.txt"

::3.2.3
fc /A "C:\LAB6\LaunchedServices.txt" "C:\LAB6\launchedServicesAfter.txt" > "C:\LAB6\launchedServicesDifference.txt"

::3.2.4
net start DNS-client
