<div{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
  <label for="{{ field.name }}">
    {{ field.label }}{% if field.required %} <span class="star text-error">*</span>{% endif %}
  </label>
  <div>
    <textarea
      id="{{ field.name }}"
      name="{{ field.name }}"
      placeholder="{{ field.placeholder }}"
      rows="5" cols="30"
      {% if field.required %} required{% endif %}
      {% if field.readonly %} readonly{% endif %}
      {% if field.tooltip %} title="{{ field.tooltip }}"{% endif %}
    >{{ field.default }}</textarea>
  </div>
</div>