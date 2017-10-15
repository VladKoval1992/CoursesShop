  $(document).ready(function() {
    $('#register_form').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            nameCourses: {
                validators: {
                        stringLength: {
                        min: 0,
                    },
                        notEmpty: {
                        message: 'Введіть будь ласка назву курсу'
                    }
                }
            },
            price: {
                validators: {
                        stringLength: {
                        min: 0,
                    },
                        notEmpty: {
                        message: 'Введіть будь ласка вартість курсу'
                    }
                }
            },
            descriptionOfCourses: {
                validators: {
                    stringLength: {
                        min: 20,
                    },
                    notEmpty: {
                        message: 'Введіть будь ласка опис курсу (мінімум 20 символів)'
                    }
                }
            },
            emblemOfCourcses: {
                validators: {
                    stringLength: {
                        min: 1,
                    },
                    notEmpty: {
                        message: 'Виберіть будь ласка файл'
                    }
                }
            }
            }
        })
        .on('success.form.bv', function(e) {

                $('#register_form').data('bootstrapValidator').resetForm();

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