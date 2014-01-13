$(document).ready(function() {
    $('.moderated').on('click', function() {
        $(this).fadeOut('slow')
    })

    $('#new-book-comment-wrapper').on('ajax:success', '.new_comment', function(e, data, textStatus, xhr) {
        appendComment(data.create_status, data.form_html, data.comment_html, data.book_id)
    })

    $(document).on('ajax:before', '.comment-answer-link', function() {
        $(this).hide()
    })

    $(document).on('ajax:success', '.comment-answer-link', function(e, data, textStatus, xhr) {
        var commentDiv = $(e.target).closest('.comment_wrapper')
        appendNestedCommentForm(commentDiv, data.form_html)
    })

    $(document).on('ajax:success', '.new_comment_comments_form', function(e, data, textStatus, xhr) {
        var commentDiv = $(e.target).closest('.comment_wrapper')
        appendNestedComment(commentDiv, data.create_status, data.form_html, data.comment_html, data.book_id)
    })

    $(document).on('click', '.cancel-comment-link', function(e) {
        e.preventDefault()
        $(this).closest('.comment_wrapper').fadeOut('slow', function() {
            $(this).closest('.nested_comments').siblings('blockquote').find('.comment-answer-link').fadeIn()
            $(this).remove()
        })
    })
})

function appendComment(status, formHTML, commentHTML, book) {
    if (status) {
        var commentDiv = $(commentHTML)
        $("#comments").append(commentDiv)
        commentDiv.hide().fadeIn("slow")
    }

    $('.new_comment', '#new-book-comment-wrapper').closest('.to_comment').replaceWith(formHTML)
}

function appendNestedCommentForm(commentDiv, formHTML) {
    if (commentDiv && formHTML) {
        var newDiv = commentDiv.clone()
        newDiv.removeAttr('id').addClass('nested_comment').html(formHTML).hide()
        newDiv.find('form').addClass('new_comment_comments_form')
        commentDiv.children('.comment').children('.nested_comments').append(newDiv)
        newDiv.slideDown()
    }
}

function appendNestedComment(commentDiv, status, formHTML, commentHTML, count) {
    if (status) {
        commentDiv.fadeOut('slow', function() {
            commentDiv.replaceWith(commentHTML).fadeIn('slow')
        })

        commentDiv.closest('.nested_comments').siblings('blockquote').find('.comment-answer-link').show()
    } else {
        commentDiv.html(formHTML).find('form').addClass('new_comment_comments_form')
    }
}