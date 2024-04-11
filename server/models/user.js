const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  username: {
    required: true,
    type: String,
    trim: true, //removes all leading and trailing spaces
  },
  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      //message runs only if value entered above is false
      message : 'Please enter a valid email address'
    },
  },
  password : {
    required :true,
    type : String,
    validate:{
        Validator:(value) => {
            return value.length > 6;
        },
        message: "Password length should be atleast 8 characters",
    }
  },
  address : {
    type :String,
    default :'',
  },
  type:{
    type:String,
    default:'user',
  }
});

const User = mongoose.model('User',userSchema);
module.exports = User;