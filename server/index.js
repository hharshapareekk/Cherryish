//Imports from packages
const express = require("express");
const mongoose = require("mongoose");

//Imports from other files
const authRouter = require("./routes/auth.js");

// Init
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://harsha:adminharsha@cluster01.gdvpcj2.mongodb.net/?retryWrites=true&w=majority&appName=Cluster01"

//Middleware
//Client -> Server -> Client (STOPS , not continuos listening( req socket io for that))
app.use(authRouter); // now knows existence of authRouter


//Connections

mongoose.connect(DB).then(() => {
  console.log('CONNECTION SUCCESSFUL');
}).catch(e => {
  console.log(e);
});
app.listen(PORT, "0.0.0.0", function () {
  console.log(`Connected at PORT ${PORT}`);
});
