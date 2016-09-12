const electron = require('electron')
var server; //iron curtain server
// Module to control application life.
const app = electron.app
// Module to create native browser window.
const BrowserWindow = electron.BrowserWindow

// Keep a global reference of the window object, if you don't, the window will
// be closed automatically when the JavaScript object is garbage collected.
let mainWindow

function createWindow () {
  // Create the browser window.
  //mainWindow = new BrowserWindow({width: 1000, height: 800, frame:false})
  mainWindow = new BrowserWindow({width: 1000, height: 800})

  // and load the index.html of the app.
  // build/curtain-elm/build
  mainWindow.loadURL(`file://${__dirname}/build/curtain-elm/build/index.html`)

  // Open the DevTools.
 // mainWindow.webContents.openDevTools()

  // Emitted when the window is closed.
  mainWindow.on('closed', function () {
    // Dereference the window object, usually you would store windows
    // in an array if your app supports multi windows, this is the time
    // when you should delete the corresponding element.
    killServer();
    mainWindow = null
  })
}

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.on('ready', createWindow)

// Quit when all windows are closed.
app.on('window-all-closed', function () {
    killServer();
    app.quit()
})

app.on('activate', function () {
  // On OS X it's common to re-create a window in the app when the
  // dock icon is clicked and there are no other windows open.
  if (mainWindow === null) {
    createWindow()
  }
})

// In this file you can include the rest of your app's specific main process
// code. You can also put them in separate files and require them here.

///Node Commmand Within JS File

var spawn = require('child_process').spawn;

function startServer(){
   console.log("Starting the webserver..");
   server = spawn(`${__dirname}/build/iron_curtain`,[],
                {stdio: ['inherit', 'inherit', 'inherit']}
            );  
}

startServer();

function killServer(){
    console.log("Killing server..");
    if(server){
        server.kill();
        console.log("killed");
    }else{
       console.log("There was NO server in the first place!"); 
    }
}
