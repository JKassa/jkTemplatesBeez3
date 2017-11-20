<div{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
  <label for="{{ field.name }}">
    {{ field.label }}{% if field.required %} <span class="star text-error">*</span>{% endif %}
  </label>
  <span class="calendar_field"{% if field.tooltip %} title="{{ field.tooltip }}"{% endif %}>
    {% if field.required %}
      {% assign options = 'required' | arrayCombine: 'required' %}
      {{ 'calendar' | jhtml: field.default, field.name, field.name, field.filter, options }}
    {% else %}
      {{ 'calendar' | jhtml: field.default, field.name, field.name, field.filter }}
    {% endif %}
  </span>
</div>