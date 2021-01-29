const functions = require("firebase-functions");
const admin = require('firebase-admin');
admin.initializeApp(functions.config().firebase);

var database = admin.database();

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//


exports.newNodeDetected = functions.database.ref("Flights/{flightID}")
    .onCreate(async (snapshot, context)=>{
      const flight = snapshot.val();
      const studentName = flight["studentname"];
      const token = flight["studentDeviceToken"];
      const instructorName = flight["instructorname"];
      var payload = {
        notification:{title: "New Flight Created", body: studentName+", You have been assigned a new flight by "+instructorName},
          data:{ click_action:"FLUTTER_NOTIFICATION_CLICK", message : "New flight"}
      }
      try{
        const response = await admin.messaging().sendToDevice(token,payload);
        console.log("Notification sent successfully");
        database.ref('metadata/changed/').set("Notification Success");
      }
      catch(er){
        console.log("Error");
        database.ref('metadata/changed/').set("Creation Error");
      }
      
});

exports.updateNodeDetected = functions.database.ref("Flights/{flightID}")
    .onUpdate(async (snapshot, context)=>{
      const flight = snapshot.val();
      const studentName = flight["studentname"];
      const token = flight["studentDeviceToken"];
      const instructorName = flight["instructorname"];
      var payload = {
        notification:{title: "Flight Updated", body: studentName+", You flight have been update by "+instructorName},
          data:{ click_action:"FLUTTER_NOTIFICATION_CLICK", message : "Update flight"}
      }
      try{
        const response = await admin.messaging().sendToDevice(token,payload);
        console.log("Notification sent successfully");
        database.ref('metadata/changed/').set("Notification updated Success");
      }
      catch(er){
        console.log("Error");
        database.ref('metadata/changed/').set("Creation Error");
      }
      
});

exports.newNodeDeleted = functions.database.ref("Flights/{flightID}")
    .onDelete(async (snapshot, context)=>{
      const flight = snapshot.val();
      const studentName = flight["studentname"];
      const token = flight["studentDeviceToken"];
      const instructorName = flight["instructorname"];
      var payload = {
          notification:{title: "Flight Deleted", body: studentName+", Flight by "+instructorName},
          data:{ click_action:"FLUTTER_NOTIFICATION_CLICK", message : "Deleted flight"}
      }
      try{
        const response = await admin.messaging().sendToDevice(token,payload);
        console.log("Notification sent successfully");
        database.ref('metadata/deleted/').set("Deletion Success");
      }
      catch(er){
        console.log("Error");
        database.ref('metadata/deleted/').set("Deletion Error");
      }
      
});
