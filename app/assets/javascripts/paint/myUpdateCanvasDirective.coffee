'use strict'

angular.module('mainApp').directive 'myUpdateCanvas', [
  'Canvas'
  'localStorageService'
  (Canvas, localStorageService) ->
    restrict: 'A'
    link: (scope, element, attrs, ctrl, transcludeFn) ->
      element.on 'change', ->
        localStorageService.set('canvas', Canvas.current)
        Canvas.current.renderAll()

]
