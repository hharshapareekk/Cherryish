//Imports from packages
const express = require("express");
const mongoose = require("mongoose");

//Imports from other files
const authRouter = require("./routes/auth.js");
const DBkey = require('./keys.js');
const donorRouter = require("./routes/donor.js");

// Init
const PORT = 3000;
const app = express();
const DB = DBkey;

//Middleware
//Client -> Server -> Client (STOPS , not continuous listening( req socket io for that))
app.use(express.json());
app.use(authRouter); // now knows existence of authRouter
app.use(donorRouter);

//Connections

mongoose.connect(DB).then(() => {
  console.log('CONNECTION SUCCESSFUL');
}).catch(e => {
  console.log(e);
});
app.listen(PORT, "0.0.0.0", function () {
  console.log(`Connected at PORT ${PORT}`);
});
