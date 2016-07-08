'use strict'

angular.module('mainApp').directive 'myClearCanvas', [
  'Canvas'
  'localStorageService'
  (Canvas, localStorageService) ->
    restrict: 'A'
    link: (scope, element, attrs, ctrl, transcludeFn) ->
      scope.checkCanvas = ->
        if Canvas.current.getObjects().length
          element.show()
        else
          element.hide()

      scope.checkCanvas()

      element.on('click', ->
        element.hide()
        Canvas.current.clear()
        localStorageService.set('canvas', Canvas.current)
      )

      Canvas.current.on('object:added', ->
        element.show()
      )

      Canvas.current.on('object:removed', ->
        checkCanvas()
      )

]
