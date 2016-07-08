'use strict'

angular.module('mainApp', [
  'ui.router'
  'templates'
  'LocalStorageModule'
]).config([
  '$stateProvider'
  '$urlRouterProvider'
  'localStorageServiceProvider'
  ($stateProvider, $urlRouterProvider, localStorageServiceProvider) ->
    $stateProvider
      .state 'main',
        url: '/'
        templateUrl: 'paint/index.html'
        controller: 'PaintCtrl as vm'

    $urlRouterProvider.otherwise '/'

    localStorageServiceProvider
      .setPrefix('paint-test')

]).run([
  '$rootScope'
  '$state'
  ($rootScope) ->
    $rootScope.$on('$stateChangeError', console.log.bind(console))

])
