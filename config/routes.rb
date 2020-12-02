Rails.application.routes.draw do

# landing page
  get("/", { :controller => "answers", :action => "landing" })

  # Routes for the Answer resource:

  # CREATE
  post("/insert_answer", { :controller => "answers", :action => "create" })
          
  # READ
  get("/answers", { :controller => "answers", :action => "index" })
  
  get("/answers/:path_id", { :controller => "answers", :action => "show" })
  
  # UPDATE
  
  post("/modify_answer/:path_id", { :controller => "answers", :action => "update" })
  
  # DELETE
  get("/delete_answer/:path_id", { :controller => "answers", :action => "destroy" })

  #------------------------------

  # Routes for the Courselist resource:

  # CREATE
  post("/insert_courselist", { :controller => "courselists", :action => "create" })
          
  # READ
  get("/courselists", { :controller => "courselists", :action => "index" })
  
  get("/courselists/:path_id", { :controller => "courselists", :action => "show" })
  
  # UPDATE
  
  post("/modify_courselist/:path_id", { :controller => "courselists", :action => "update" })
  
  # DELETE
  get("/delete_courselist/:path_id", { :controller => "courselists", :action => "destroy" })

  #------------------------------

  # Routes for the Grouplist resource:

  # CREATE
  post("/insert_grouplist", { :controller => "grouplists", :action => "create" })
          
  # READ
  get("/grouplists", { :controller => "grouplists", :action => "index" })
  
  get("/grouplists/:path_id", { :controller => "grouplists", :action => "show" })
  
  # UPDATE
  
  post("/modify_grouplist/:path_id", { :controller => "grouplists", :action => "update" })
  
  # DELETE
  get("/delete_grouplist/:path_id", { :controller => "grouplists", :action => "destroy" })

  #------------------------------

  # Routes for the Course resource:

  # CREATE
  post("/insert_course", { :controller => "courses", :action => "create" })
          
  # READ
  get("/courses", { :controller => "courses", :action => "index" })
  
  get("/courses/:path_id", { :controller => "courses", :action => "show" })
  
  # UPDATE
  
  post("/modify_course/:path_id", { :controller => "courses", :action => "update" })
  
  # DELETE
  get("/delete_course/:path_id", { :controller => "courses", :action => "destroy" })

  #------------------------------

  # Routes for the Group resource:

  # CREATE
  post("/insert_group", { :controller => "groups", :action => "create" })
          
  # READ
  get("/groups", { :controller => "groups", :action => "index" })
  
  get("/groups/:path_id", { :controller => "groups", :action => "show" })
  
  # UPDATE
  
  post("/modify_group/:path_id", { :controller => "groups", :action => "update" })
  
  # DELETE
  get("/delete_group/:path_id", { :controller => "groups", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------
#### Submit
post("/submit1", { :controller => "answers", :action => "selection1" })
post("/submit2", { :controller => "answers", :action => "selection2" })
post("/submit3", { :controller => "answers", :action => "selection3" })
post("/submit4", { :controller => "answers", :action => "selection4" })
post("/submit5", { :controller => "answers", :action => "selection5" })
end
