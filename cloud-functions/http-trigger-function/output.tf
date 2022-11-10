output cloud_functions_created {
  value = map(google_cloudfunctions_function.http-function.name, 
              google_cloudfunctions_function.http-function.id)
  description = "Function name and Function ID/URL map for google cloud functions"
}