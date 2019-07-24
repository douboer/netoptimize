set obj=createobject("wscript.shell")
do
    wscript.sleep 7200000
    obj.run "test.bat"
loop
