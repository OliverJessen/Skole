import de.bezier.data.sql.*;

ArrayList<Data> NameData = new ArrayList<Data>();

String mode = "";
SQLite db;

void setup() {

}

void draw() {

  GetData();
}

void GetData()
{
//Connect to database
 db = new SQLite( this, "Test.sqlite" );
  
  //If connection is succesfull
 if ( db.connect() )
 {
   
   //Start kode for select
     //Make Select query
      db.query( "SELECT ID, Navn, Efternavn FROM test_tabel;" );
      //Run through recordset using next()
      while (db.next()) {
        //Print the data to the log window. 
        println("ID: " + db.getInt("ID") + " \t Name: " + db.getString("Navn") + " \t Name: " + db.getString("Efternavn"));
      }
   //Slut kode for select 
  } else {
    //Display error trying to get data from DB
    println("Error DB"); }
  db.close();
}
