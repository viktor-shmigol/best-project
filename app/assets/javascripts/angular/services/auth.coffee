bestProject.factory 'Auth',['Session', 'User', '$q', '$cookies', '$window', '$location', 'Flash', (Session, User, $q, $cookies, $window, $location, Flash) ->
  userInfo = undefined

  return {
    login: (credentials) ->
      deferred = $q.defer()

      Session.save credentials,
        (result) ->
          $cookies.put('access_token', result.token)
          userInfo = result
          $window.sessionStorage['userInfo'] = JSON.stringify(userInfo)
          deferred.resolve userInfo
          $location.path '/home'
        (error) ->
          deferred.reject error
          Flash.create 'warning', error.data.message
      deferred.promise

    logout: ->
      userInfo = undefined
      $cookies.remove('access_token')
      delete $window.sessionStorage['userInfo']
      $location.path '/sign_in'

    signUp: (credentials) ->
      User.save user: credentials,
        (user) ->
          $cookies.put('access_token', user.token)
          userInfo = user
          $window.sessionStorage['userInfo'] = JSON.stringify(userInfo)
          $location.path '/home'
        (error) ->
          angular.forEach error.data.errors, (value, key) ->
            Flash.create 'danger', "#{key}: #{value}"

    getUserInfo: ->
      if $window.sessionStorage['userInfo']
        userInfo = JSON.parse($window.sessionStorage["userInfo"])
      else
        User.get()
  }
]
