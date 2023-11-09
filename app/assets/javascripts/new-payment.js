document.addEventListener('DOMContentLoaded', () => {
      let checkboxes = document.querySelectorAll('#payment-form input[type="checkbox"]');
      let submitButton = document.querySelector('#payment-form input[type="submit"]');

      const updateSubmitButton = () => {
        let checkedCheckboxes = Array.from(checkboxes).filter((checkbox) => {
          return checkbox.checked;
        });

        submitButton.disabled = (checkedCheckboxes.length === 0);
      }

      checkboxes.forEach((checkbox) => {
        checkbox.addEventListener('change', updateSubmitButton);
      });

      // Initial state
      updateSubmitButton();
    });