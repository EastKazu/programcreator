function search() {
  // 作曲家で絞り込み
  const composerForm = document.getElementById("composer-checkboxes");
  const composerCheckBox = document.getElementById("composer-checkbox");

  composerForm.addEventListener('click', function() {
    if (composerCheckBox.style.display === "block") {
      composerCheckBox.style.display = "none";
    } else {
      composerCheckBox.style.display = "block";
    }
  });

  // ジャンルで絞り込み
  const genreForm = document.getElementById("genre-checkboxes");
  const genreCheckBox = document.getElementById("genre-checkbox");

  genreForm.addEventListener('click', function() {
    if (genreCheckBox.style.display === "block") {
      genreCheckBox.style.display = "none";
    } else {
      genreCheckBox.style.display = "block";
    }
  });

  // 国で絞り込み
  const countryForm = document.getElementById("country-checkboxes");
  const countryCheckBox = document.getElementById("country-checkbox");

  countryForm.addEventListener('click', function() {
    if (countryCheckBox.style.display === "block") {
      countryCheckBox.style.display = "none";
    } else {
      countryCheckBox.style.display = "block";
    }
  });

  // 作曲年で絞り込み
  const yearForm = document.getElementById("year-fields");
  const yearField = document.getElementById("year-field");

  yearForm.addEventListener('click', function() {
    if (yearField.style.display === "block") {
      yearField.style.display = "none";
    } else {
      yearField.style.display = "block";
    }
  });
}

window.addEventListener('turbo:load', search);
window.addEventListener('pageshow', search);

