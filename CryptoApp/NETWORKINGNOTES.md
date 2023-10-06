#  STEPS TO MAKE A NETWORK CALL


1.) Find your desired API
2.) Find your desired API endpoint/request URL
3.) Create a ViewModel
4.) Create a function inside of your VM

5.) Define your urlString 
6.) Convert URL string to URL object

7.) Define your URLSession.shared.dataTask with your completion handler 
8.) from this call you will possibly recieve back data, a response, and an error.
9.) Handle the possible error inside of the dataTask first
10.) Handle possible response and print response code
11.) Check to see if you have received data back from dataTask
- Do not forget to add .resume() at the end of the func

12.) Create an initializer for the class and place the func in it so that the func runs when the VM is initialized

13.) Implement the VM in the your desired view so that the VM exists within the environment and you can use the data for the UI


- Data Model
15.) Create a data model to turn all of the raw data into a swiftObject (Coin file)
16.) Copy all of your json data from the API and go to app.quicktype.io website
17.) Select swift as your language and struct as your type. Only toggle on Explicit CodingKey values in Codable types. 
18.) Paste in your JSON data 
19.) Copy what you receive back and paste it into your DataModel(Coin)
20.) Make necessary cahnges adn cahnge some properties to Optional if necessary and so on 

- Decode fetched data into swift object 
21.) Back in the VM. Begin your decoding from JSON to swiftObject using the object we just pasted into the DataModel
22.) Store the decoded array of coins into the @Publsihed property "coins"
23.) Make the correct types exist within the correct environments and replace forEach loops and Text properties with the correct interpolation
