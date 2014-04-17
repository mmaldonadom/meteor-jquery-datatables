Template.home.pages = ->
  pages =
    columns: [
      {
        sTitle: "Route"
        mData: "route"
      }
      {
        sTitle: "Path"
        mData: "path"
      }
      {
        sTitle: "Controller"
        mData: "controller"
      }
      {
        sTitle: "Title"
        mData: "page.title"
        mRender:  ( dataSource, call, rawData ) ->
          rawData.page.title ?= ""
      }
      {
        sTitle: "Subtitile"
        mData: "page.subtitle"
        mRender:  ( dataSource, call, rawData ) ->
          rawData.page.subtitle ?= ""
      }
    ]
    selector: "dataTable-pages"
    rows: Pages.find().fetch()
  return pages

Template.home.browsers = ->
  browsers =
    columns: [
      {
        sTitle: "Engine"
        mData: "engine"
      }
      {
        sTitle: "Browser"
        mData: "browser"
      }
      {
        sTitle: "Platform"
        mData: "platform"
      }
      {
        sTitle: "Version"
        mData: "version"
        sClass: "center"
      }
      {
        sTitle: "Grade"
        mData: "grade"
        sClass: "center"
        mRender: ( dataSource, call, rawData ) ->
          rawData ?= ""
          switch rawData.grade
            when "A" then return "<b>A</b>"
            else return rawData.grade
      }
      {
        sTitle: "Created"
        mData: "createdAt"
        mRender: ( dataSource, call, rawData ) ->
          rawData.createdAt ?= ""
          if rawData.createdAt
            return moment( rawData.createdAt ).fromNow()
          else return rawData.createdAt
      }
      {
        sTitle: "Counter"
        mData: "counter"
      }
    ]
    selector: "dataTable-browsers"
    collection: Browsers
    subscription: "all_browsers"
  return browsers