'use strict'

angular.module('mainApp').factory 'Canvas', [
  'localStorageService'
  (localStorageService) ->
    o = this

    o.current = new fabric.Canvas('w1')
    o.selectedObj = null
    o.selectedGroup = null
    o.current.loadFromJSON(localStorageService.get('canvas'), o.current.renderAll.bind(o.current))
    o.objects =
      'circle': 'Circle'
      'rect': 'Rectangle'
      'text': 'Text'
    o.obj = 'circle'
    o.params =
      radius: 50
      fill: '#000'
      opacity: 1
      applyFill: null
      top: 0
      left: 0
      text: ''
      width: 50
      height: 50
      stroke: '#000'
      strokeWidth: 1

    o.add = (obj) ->
      params = o.getParams(obj)

      if obj is 'text'
        o.current.add(new fabric.Text(o.params.text, params))
      else
        o.current.add(new fabric[o.capitalize(obj)](params))

    o.getParams = (obj) ->
      params =
        fill: o.params.fill
        top: o.params.top
        left: o.params.left
        stroke: o.params.stroke
        strokeWidth: o.params.strokeWidth
        opacity: o.params.opacity

      unless o.params.applyFill
        params.fill = null

      switch obj
        when 'circle'
          params.radius = o.params.radius
        when 'rect'
          params.width = o.params.width
          params.height = o.params.height
      params

    o.capitalize = (str) ->
      str ||= ''
      str.charAt(0).toUpperCase() + str.slice(1)

    o
]
