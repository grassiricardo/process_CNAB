**Test API Process CNAB for PagNet**
![ruby](https://img.shields.io/badge/Ruby-2.4.1-green.svg)
![rails](https://img.shields.io/badge/Rails-5.1.5-green.svg)
[![Build Status](https://travis-ci.org/grassiricardo/process_CNAB.svg?branch=master)](https://travis-ci.org/grassiricardo/process_CNAB)

**Description**
It is necessary through a call via API to process a CNAB file where it contains several information which in turn will be partners for the use of the information.

Only information on Debits and Credits should be processed and recorded in a secure way so that only accredited users can view.

**# Documentation for use both in development and production**

https://documenter.getpostman.com/view/1657038/process_cnab_api/RVnPLPtQ

**How to Use Via Heroku**
For users in Heroku, it is enough to fulfill the requirements for production. The same is in the following path:

https://process-cnab-api.herokuapp.com/

With the path in a postman of life, you will be able to carry out both the processing of the CNAB file and the visualization of the transactions already carried out.

**Running in Development**
Clone Path Project https://github.com/grassiricardo/process_CNAB.git
Run `bundle install` to install the project dependencies
Now to create the bank and perform the migrations run:
`rails db:create` and then `rails db:migrate`
Ready now just just upload the server using the `rails s`

**Step by step process being executed with their respective calls**
**NOTE**: Always remember that if you are running local should be added before the api route itself is the local path `localhost:3000` or if it is in production `https://process-cnab-api.herokuapp.com/`

**First step** turn the call to `/api/v1/process_cnab`, this will cause the file that is already in the project root to be processed.

**Second step** to verify that the files have been processed successfully you should first be accredited in the API using the following api `/v1/auth` route passing in the body of the request your email and password (The examples can be found in the documentation above)

**Third and last step** so that it is possible to present the transactions processed use the path `api/v1/transactions` and in the header of the request pass the keys to api to identify that you are already registered and you can use this information, the keys are:
**access-token**
**client**
**uid**
These 3 keys are always returned when registering or when requesting a new key in the following route `/api/v1/auth/sign_in` informing your registered email and password.
