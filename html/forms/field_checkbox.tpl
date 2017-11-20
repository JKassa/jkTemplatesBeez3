<div{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
  <label for="{{ field.name }}">
    {{ field.label }}{% if field.required %} <span class="star text-error">*</span>{% endif %}
  </label>
  <label class="checkbox">
    <input
        type="checkbox"
        id="{{ field.name }}"
        name="{{ field.name }}"
        value="{{ field.default }}"
        {% if field.required %} required{% endif %}
        {% if field.readonly %} disabled{% endif %}
        {% if field.default == field.label %} checked{% endif %}
        {% if field.tooltip %} title="{{ field.tooltip }}"{% endif %}
    >
    {{ value }}
  </label>
</div>