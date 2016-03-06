bestProject.factory 'authHttpResponseInterceptor', [
  '$q'
  '$location'
  ($q, $location) ->
    {
      response: (response) ->
        response or $q.when(response)
      responseError: (rejection) ->
        if rejection.status == 401
          $location.path '/sign_in'
        $q.reject rejection

    }
]
