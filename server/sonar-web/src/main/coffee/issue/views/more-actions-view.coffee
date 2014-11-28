define [
  'templates/issue'
  'common/popup'
], (
  Templates
  PopupView
) ->

  $ = jQuery


  class extends PopupView
    template: Templates['issue-more-actions']


    events: ->
      'click .js-issue-action': 'action'


    action: (e) ->
      actionKey = $(e.currentTarget).data 'action'
      @options.detailView.action actionKey


    serializeData: ->
      componentKey = encodeURIComponent @model.get 'component'
      issueKey = encodeURIComponent @model.get 'key'
      _.extend super,
        permalink: "#{baseUrl}/component/index#component=#{componentKey}&currentIssue=#{issueKey}"