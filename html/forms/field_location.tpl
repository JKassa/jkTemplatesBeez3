<div{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
  <label class="control-label">
    {{ field.label }}{% if field.required %} <span class="star text-error">*</span>{% endif %}
  </label>
  <div id="{{ field.name }}">
    <div class="controls m-b-10" id="locations_countries_wrapper">
      <label for="locations_countries" style="display:none">{{ '_' | jtext: 'COM_JKASSA_COUNTRY' }}</label>
      <select name="locations_countries" id="locations_countries" class="form-control input-sm"{% if field.required %} required{% endif %}>
        <option value="">{{ '_' | jtext: 'COM_JKASSA_COUNTRY_SELECT' }}</option>
      </select>
    </div>
    <div class="controls m-b-10" id="locations_regions_wrapper">
      <label for="locations_regions" style="display:none">{{ '_' | jtext: 'COM_JKASSA_STATE' }}</label>
      <select name="locations_regions" id="locations_regions" class="form-control input-sm"{% if field.required %} required{% endif %}>
        <option value="">{{ '_' | jtext: 'COM_JKASSA_STATE_SELECT' }}</option>
      </select>
    </div>
    <div class="controls" id="locations_cities_wrapper">
      <label for="locations_cities" style="display:none">{{ '_' | jtext: 'COM_JKASSA_CITY' }}</label>
      <select name="locations_cities" id="locations_cities" class="form-control input-sm"{% if field.required %} required{% endif %}>
        <option value="">{{ '_' | jtext: 'COM_JKASSA_CITY_SELECT' }}</option>
      </select>
    </div>
  </div>
</div>