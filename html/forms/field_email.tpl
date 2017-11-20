<div{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
  <label for="{{ field.name }}">
    {{ field.label }}{% if field.required %} <span class="star text-error">*</span>{% endif %}
  </label>
  <div>
    <input
        type="email"
        id="{{ field.name }}"
        name="{{ field.name }}"
        value="{{ field.default }}"
        size="30"
        {% if field.placeholder %} placeholder="{{ field.placeholder }}"{% endif %}
        {% if field.required %} required{% endif %}
        {% if field.tooltip %} title="{{ field.tooltip }}"{% endif %}
    >
  </div>
</div>