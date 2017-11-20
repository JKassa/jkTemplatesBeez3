<div class="logout">
  <form action="{{ form_action }}" method="post">
    <p>
      <label>
        {{ userName }}
      </label>
      <button type="submit" class="button" {% if target %} formtarget="_top" {% endif %}>
        {{ '_' | jtext: 'JLOGOUT' }}
      </button>
    </p>
    <input type="hidden" name="return" value="{{return}}" />
    {{token}}
  </form>
</div>