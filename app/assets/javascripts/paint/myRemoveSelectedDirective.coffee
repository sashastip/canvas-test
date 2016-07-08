'use strict'

angular.module('mainApp').directive 'myRemoveSelected', [
  'Canvas'
  (Canvas) ->
    restrict: 'A'
    link: (scope, element, attrs, ctrl, transcludeFn) ->
      element.on 'click', ->
        if scope.vm.selectedObj
          if confirm('Are you sure?')
            Canvas.current.remove(scope.vm.selectedObj)
        else if scope.vm.selectedGroup
          if confirm('Are you sure?')
            selected = scope.vm.selectedGroup.getObjects()
            Canvas.current.discardActiveGroup()
            selected.forEach (obj) ->
              Canvas.current.remove(obj)

]
