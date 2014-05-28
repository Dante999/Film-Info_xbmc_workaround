@echo off


REM Program Header
echo Film Info! Organizer converter
echo "created by Dante999"
echo.
echo "Wählen der Aufgabe:"
echo "[1] Film Info Organizer! -> XMBC Frodo"
echo "[2] XMBC Frodo           -> Film Info Organizier"
set /p task=Aufgabe: 
echo.
echo.
echo "Film Info! Organizer <-> XBMC Frodo Konverter" > log.txt
echo "created by Dante999" >> log.txt
echo. >> log.txt
   
REM Durchsuche Unterordner und schreibe die Namen in 'G'   
for /f "tokens=*" %%G in ('dir *. /b /n') do (
    
    echo "%%G" >> log.txt
    cd "%%G"
    echo "%%G"

    REM Bennene vom Organizer in XBMC Frodo
    if %task%==1 (

     
        REM Suche nach einer Filmdatei
        for %%i in (*.asx* *.avi* *.dvr-ms* *.m2ts* *.mkv* *.mov* *.mp4* *.mpeg* *.mpg* *.wmv* *.wpl* *.wtv* *.xvid* *.ts* *.iso*) do ( 
      
            if not exist "movie.nfo" ( 
                echo "keine 'movie.nfo' vorhanden!" 
                cd ..
                echo "#keine 'movie.nfo' vorhanden!" >> log.txt
                cd "%%G"               
            )
            
            if exist "movie.nfo" ( 
                rename "movie.nfo" "%%~ni.nfo" 
                cd ..
                echo "movie.nfo  -> %%~ni.nfo" >> log.txt
                cd "%%G"               
            )        

            if not exist "folder.jpg" ( 
                echo "keine 'folder.jpg' vorhanden!" 
                cd ..
                echo "#keine 'folder.jpg' vorhanden!" >> log.txt
                cd "%%G"  
            )
            
            if exist "folder.jpg" ( 
                rename "folder.jpg" "%%~ni-poster.jpg"
                cd ..
                echo "folder.jpg -> %%~ni-poster.jpg" >> log.txt
                cd "%%G"  
            )

        ) 

    )
    
    REM Benenne vom XBMC Frodo auf Organizer   
    if %task%==2 (

        REM Suche nach einer Filmdatei
        for %%i in (*.asx* *.avi* *.dvr-ms* *.m2ts* *.mkv* *.mov* *.mp4* *.mpeg* *.mpg* *.wmv* *.wpl* *.wtv* *.xvid* *.ts* *.iso*) do (
        
            if not exist "%%~ni.nfo" ( 
                echo "keine '%%~ni.nfo' vorhanden!" 
                cd ..
                echo "#keine '%%~ni.nfo' vorhanden!" >> log.txt
                cd "%%G"            
            )
            
            if exist "%%~ni.nfo" ( 
                rename "%%~ni.nfo" "movie.nfo" 
                cd ..
                echo "%%~ni.nfo        -> movie.nfo" >> log.txt
                cd "%%G"          
            )
            
            if not exist "%%~ni-poster.jpg" (
                echo "keine '%%~ni-poster.jpg' vorhanden!" 
                cd ..
                echo "#keine '%%~ni-poster.jpg' vorhanden!" >> log.txt
                cd "%%G"  
            )
            
            if exist "%%~ni-poster.jpg" ( 
                rename "%%~ni-poster.jpg" "folder.jpg" 
                cd ..
                echo "%%~ni-poster.jpg -> folder.jpg" >> log.txt
                cd "%%G" 
            )
        )  

    )    
    
    echo.
    cd ..
    echo. >> log.txt

)

pause
exit


