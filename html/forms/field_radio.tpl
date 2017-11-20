<div{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
  <label for="{{ field.name }}">
    {{ field.label }}{% if field.required %} <span class="star text-error">*</span>{% endif %}
  </label>
  <span{% if field.tooltip %} title="{{ field.tooltip }}"{% endif %}>
    {% for value in field.values %}
    <label class="radio">
      <input
          type="radio"
          name="{{ field.name }}"
          value="{{ value }}"
          {% if field.default == value %} checked{% endif %}
          {% if field.required %} required{% endif %}
          {% if field.readonly %} disabled{% endif %}
      >
      {{ value }}
    </label>
    {% endfor %}
  </span>
</div>