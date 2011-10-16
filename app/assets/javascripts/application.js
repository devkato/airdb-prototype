// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
  $('#file_upload').fileUploadUI({
    uploadTable: $('#files'),
    downloadTable: $('#files'),
  
    //buildUploadRow: function (files, index) {
    //    return $(
    //      '<tr><td class="file_upload_preview"><\/td>' +
    //      '<td>' + files[index].name + '<\/td>' +
    //      '<td class="file_upload_progress"><div><\/div><\/td>' +
    //      '<td class="file_upload_start">' +
    //      '<button class="ui-state-default ui-corner-all" title="Start Upload">' +
    //      '<span class="ui-icon ui-icon-circle-arrow-e">Start Upload<\/span>' +
    //      '<\/button><\/td>' +
    //      '<td class="file_upload_cancel">' +
    //      '<button class="ui-state-default ui-corner-all" title="Cancel">' +
    //      '<span class="ui-icon ui-icon-cancel">Cancel<\/span>' +
    //      '<\/button><\/td><\/tr>'
    //    );
    //},
    //buildDownloadRow: function (file) {
    //    return $('<tr><td>' + file.name + '<\/td><\/tr>');
    //},
    //beforeSend: function (event, files, index, xhr, handler, callBack) {
    //    handler.uploadRow.find('.file_upload_start button').click(callBack);
    //}
  
    buildUploadRow: function (files, index) {
      return $('<tr><td>' + files[index].name + '<\/td>' +
              '<td class="file_upload_progress"><div><\/div><\/td>' +
              '<td class="file_upload_cancel">' +
              '<button class="ui-state-default ui-corner-all" title="Cancel">' +
              '<span class="ui-icon ui-icon-cancel">Cancel<\/span>' +
              '<\/button><\/td><\/tr>');
    },
    //buildDownloadRow: function (file) {
    //  return $('<tr><td>' + file.name + '<\/td><\/tr>');
    //}
    onComplete: function (event, files, index, xhr, handler) {
      handler.onCompleteAll(files);
    },
    onAbort: function (event, files, index, xhr, handler) {
      handler.removeNode(handler.uploadRow);
      handler.onCompleteAll(files);
    },
    onCompleteAll: function (files) {
      // The files array is a shared object between the instances of an upload selection.
      // We extend it with a uploadCounter to calculate when all uploads have completed:
      if (!files.uploadCounter) {
          files.uploadCounter = 1;  
      } else {
          files.uploadCounter = files.uploadCounter + 1;
      }
      if (files.uploadCounter === files.length) {
        $.ajax({
          url: "<%= root_path %>",
          dataType: 'script',
          type: 'GET'
          //context: document.body,
          //success: function(){
          //  $(this).addClass("done");
          //}
        });
      }
    }
  });
});

