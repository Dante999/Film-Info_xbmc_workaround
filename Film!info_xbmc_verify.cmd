@echo off




REM PFAD ANGEBEN

REM Program Header
echo "Film Info! Organizer <-> XBMC Frodo verify" 
echo "created by Dante999"
echo.
echo "Was soll auf das korrekte Format geprueft werden?"
echo "[1] Film Info! Organizer"
echo "[2] XMBC Frodo"
set /p task=Aufgabe: 
echo.
echo.
echo "Film Info! Organizer <-> XBMC Frodo verify" > log_verify.txt
echo "created by Dante999" >> log_verify.txt
echo. >> log_verify.txt
   
REM Durchsuche Unterordner und schreibe die Namen in 'G'   
for /f "tokens=*" %%G in ('dir *. /b /n') do (
    
    echo "%%G" >> log_verify.txt
    cd "%%G"
    echo "%%G"

    REM Ueberpruefe Film Info! Organizer Format
    if %task%==1 (

     
        REM Suche nach einer Filmdatei
        for %%i in (*.asx* *.avi* *.dvr-ms* *.m2ts* *.mkv* *.mov* *.mp4* *.mpeg* *.mpg* *.wmv* *.wpl* *.wtv* *.xvid* *.ts* *.iso*) do ( 
      
            if not exist "movie.nfo" ( 
                echo "#keine 'movie.nfo' vorhanden!" 
                cd ..
                echo "#keine 'movie.nfo' vorhanden!" >> log_verify.txt
                cd "%%G"               
            )
            
            if exist "movie.nfo" ( 
                echo "movie.nfo OK"
                cd ..
                echo "movie.nfo OK" >> log_verify.txt
                cd "%%G"               
            )        

            if not exist "folder.jpg" ( 
                echo "#keine 'folder.jpg' vorhanden!" 
                cd ..
                echo "#keine 'folder.jpg' vorhanden!" >> log_verify.txt
                cd "%%G"  
            )
            
            if exist "folder.jpg" ( 
                echo "folder.jpg OK"
                cd ..
                echo "folder.jpg OK" >> log_verify.txt
                cd "%%G"  
            )

        ) 

    )
    
    REM Ueberpruefe XBMC Frodo Format  
    if %task%==2 (

        REM Suche nach einer Filmdatei
        for %%i in (*.asx* *.avi* *.dvr-ms* *.m2ts* *.mkv* *.mov* *.mp4* *.mpeg* *.mpg* *.wmv* *.wpl* *.wtv* *.xvid* *.ts* *.iso*) do (
        
            if not exist "%%~ni.nfo" ( 
                echo "#keine '%%~ni.nfo' vorhanden!" 
                cd ..
                echo "#keine '%%~ni.nfo' vorhanden!" >> log_verify.txt
                cd "%%G"            
            )
            
            if exist "%%~ni.nfo" ( 
                echo "%%~ni.nfo OK" 
                cd ..
                echo "%%~ni.nfo OK"  >> log_verify.txt
                cd "%%G"          
            )
            
            if not exist "%%~ni-poster.jpg" (
                echo "#keine '%%~ni-poster.jpg' vorhanden!" 
                cd ..
                echo "#keine '%%~ni-poster.jpg' vorhanden!" >> log_verify.txt
                cd "%%G"  
            )
            
            if exist "%%~ni-poster.jpg" ( 
                echo "%%~ni-poster.jpg vorhanden"
                cd ..
                echo "%%~ni-poster.jpg vorhanden" >> log_verify.txt
                cd "%%G" 
            )
        )  

    )    
    
    echo.
    cd ..
    echo. >> log_verify.txt

)

pause
exit


