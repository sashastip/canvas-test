'use strict'

angular.module('mainApp').controller('PaintCtrl', [
  'localStorageService'
  '$scope'
  'Canvas'
  (localStorageService, $scope, Canvas) ->
    vm = this
    vm.objects = Canvas.objects
    vm.obj = Canvas.obj
    vm.params = Canvas.params
    vm.canvas = Canvas.current
    vm.selectedObj = Canvas.selectedObj
    vm.selectedGroup = Canvas.selectedGroup
    vm.capitalize = Canvas.capitalize

    vm.add = ->
      Canvas.add(vm.obj)

    vm.updateSelected = ->
      localStorageService.set('canvas', vm.canvas)
      vm.canvas.renderAll()

    vm.selectionType = ->
      if vm.selectedObj
        vm.objects[vm.selectedObj.type]
      else
        ''

    vm.canvas.on('selection:cleared', ->
      $scope.$apply ->
        vm.selectedObj = null
        vm.selectedGroup = null
    )

    vm.canvas.on('selection:created', ({target}) ->
      $scope.$apply ->
        vm.selectedObj = null
        vm.selectedGroup = target
    )

    vm.canvas.on('object:selected', ({target}) ->
      $scope.$apply ->
        if target.type is 'group'
          vm.selectedGroup = target
        else
          vm.selectedObj = target
    )

    vm.canvas.on('object:modified', ({target}) ->
      localStorageService.set('canvas', vm.canvas)
      vm.selectedObj = target
    )

    vm.canvas.on('object:removed', ->
      localStorageService.set('canvas', vm.canvas)
    )

    vm.canvas.on('object:added', ->
      localStorageService.set('canvas', vm.canvas)
    )

    vm
])
