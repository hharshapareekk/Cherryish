const express = require('express');
const User = require('../models/user');

const authRouter =  express.Router();
// authRouter.get('/user' , (req,res) => {
//     res.json({message: "harsha"})
// })

authRouter.post('api/signup', async(req,res) => {
    //get data  - >post data into db -> return the data to user
   const {username , email ,password} =  req.body; // the data here will be map eg. name: harsha
   const existingUser = await User.findOne({email }); // find one is a promise and returns if there's alr a user with this mail id in db
    if(existingUser){
        return res.status(400).json({message : 'User with same email already exists'}); // by def it says 200 (success) but we know it is not so we manually pass status value for our api
    }

   let user = new User({
    email,
    username,
    password,
    })
   user = await user.save();
   res.json(user);
})
module.exports = authRouter;