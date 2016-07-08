'use strict'

angular.module('mainApp').directive 'myUpdateCanvas', [
  'Canvas'
  'localStorageService'
  (Canvas, localStorageService) ->
    restrict: 'A'
    link: (scope, element, attrs, ctrl, transcludeFn) ->
      target = 'vm.selectedObj.' + attrs.id.slice(9)

      scope.$watch(target, (newValue, oldValue) ->
        localStorageService.set('canvas', Canvas.current)
        Canvas.current.renderAll()
      )

]
