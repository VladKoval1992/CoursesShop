  $(document).ready(function() {
    $('#contact_form').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
           name: {
                validators: {
                        stringLength: {
                        min: 0,
                    },
                        notEmpty: {
                        message: 'Введіть будь ласка імя'
                    }
                }
            },
     password: {
                validators: {
                        stringLength: {
                        min: 0,
                    },
                        notEmpty: {
                        message: 'Введіть будь ласка пароль'
                    }
                }
            },        lastName: {
                validators: {
                     stringLength: {
                        min: 0,
                    },
                    notEmpty: {
                        message: 'Введіть будь ласка фамілію'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'Введіть email '
                    },
                    emailAddress: {
                        message: 'Не корректно введнний email '
                    }
                }
            },
            phone: {
                validators: {
                    notEmpty: {
                        message: 'Введіть номер телефону'
                    },
                    phone: {
                        country: 'US',
                        message: 'Не корректно ввдений номер телефону'
                    }
                }
            },
            adres: {
                validators: {
                     stringLength: {
                        min: 0,
                    },
                    notEmpty: {
                        message: 'Введіть свою адресу'
                    }
                }
            },
            city: {
                validators: {
                     stringLength: {
                        min: 0,
                    },
                    notEmpty: {
                        message: 'Введіть своє місто'
                    }
                }
            },
            country: {
                validators: {
                    notEmpty: {
                        message: 'Введіть свою країну'
                    }
                }

            }
            }
        })
        .on('success.form.bv', function(e) {
            $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
                $('#contact_form').data('bootstrapValidator').resetForm();

            // Prevent form submission
            e.preventDefault();

            // Get the form instance
            var $form = $(e.target);

            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');

            // Use Ajax to submit form data
            $.post($form.attr('action'), $form.serialize(), function(result) {
                console.log(result);
            }, 'json');
        });
});