$(document).on('turbolinks:load', function() {
  let showError, stripeResponseHandler, submitHandler;
  function submitHandler(event) {
    let $form = event.target;
    $form.find('input[type=submit]').prop('disabled', true);
    // if stripe was initialized correctly this will create a token using the credit card info
    if (Stripe) {
      Stripe.card.createToken($form, stripeResponseHandler);
    } else {
      showError('Failed to load credit card processing functionality. Please reload this page in your browser.');
    }
    return false;
  }
  function stripeResponseHandler(status, response) {
    let token, $form;
    $form = $('.cc_form');
    if (response.error) {
      console.error(response.error.message);
      showError(response.error.message);
    } else {
      token = response.id;
      $form.append($('<input type="hidden" name="payment[token]">')).val(token);
      $('[data-stripe=number]').remove();
      $('[data-stripe=cvc]').remove();
      $('[data-stripe=exp-year]').remove();
      $('[data-stripe=exp-month').remove();
      $form.get(0).submit();
    }
    return false;
  }
  function showError(message) {
    $('#messages').html(
      `<div class="alert alert-danger alert-dismissible fade show mb-4" role="alert">
        ${message}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>`
    );
    $('.alert').delay(5000).fadeOut(3000);
    return false;
  }
  $('.cc_form').on('submit', submitHandler);
});
