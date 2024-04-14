const express = require("express");
const User = require("../models/user.js");
const bcryptjs = require("bcryptjs");
const jwt = require('jsonwebtoken');

const authRouter = express.Router();
// authRouter.get('/user' , (req,res) => {
//     res.json({message: "harsha"})
// })

authRouter.post("/api/signup", async (req, res) => {
  //get data  - >post data into db -> return the data to user
  try {
    const { username, email, password } = req.body; // the data here will be map eg. {name: harsha}
    const existingUser = await User.findOne({ email }); // find one is a promise and returns if there's alr a user with this mail id in db
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with same email already exists" }); // by def it says 200 (success) but we know it is not so we manually pass status value for our api
    }
    const hashedPassword = await bcryptjs.hash(password, 8);
    let user = new User({
      email,
      username,
      password: hashedPassword,
    });
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({
      error: e.message,
    });
  }
});

//sign in Route
authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });
    if (!user) {
      return res
        .status(400)
        .json({ msg: "User With This Mail Id Doesn't Exist" });
    }
    const isMatch = await bcryptjs.compare(password, user.password);
    if (!isMatch) {
      return res
      .status(400)
      .json({ msg: "Incorrect Password" });
    }
    const token = jwt.sign({id:user._id},"passwordKey");
    res.json({token,...user._doc})
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
module.exports = authRouter;
