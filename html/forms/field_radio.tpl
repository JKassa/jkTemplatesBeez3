<div{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
  <label for="{{ field.name }}">
    {{ field.label }}{% if field.required %} <span class="star text-error">*</span>{% endif %}
  </label>
  <span{% if field.tooltip %} title="{{ field.tooltip }}"{% endif %}>
    {% for val in field.values %}
    <label class="radio">
      <input
          type="radio"
          name="{{ field.name }}"
          value="{{ val.value }}"
          {% if field.default == val.value %} checked{% endif %}
          {% if field.required %} required{% endif %}
          {% if field.readonly %} disabled{% endif %}
      >
      {{ val.text }}
    </label>
    {% endfor %}
  </span>
</div>