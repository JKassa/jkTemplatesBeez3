<h3>
  {{ title }}
</h3>

<div class="login">
  <form action="{{ form_action }}" method="post">
    <fieldset>
      <p>
        <span class="star">*</span> {{ '_' | jtext: 'COM_JKASSA_REQUIRED_FIELD' }}
      </p>
      <div>
        <label for="jkUsername" class="required">
          {{ '_' | jtext: 'JGLOBAL_USERNAME' }} <span class="star">*</span>
        </label>
        <div>
          <input name="username" id="jkUsername" class="validate-username required" type="text" value="" maxlength="30" required="required" />
        </div>
      </div>
      <div>
        <label for="jkPassword" class="required">
          {{ '_' | jtext: 'JGLOBAL_PASSWORD' }} <span class="star">*</span>
        </label>
        <div>
          <input name="password" id="jkPassword" class="validate-password required" type="password" value="" maxlength="30" required="required" />
        </div>
      </div>
      {% if twoFactorMethods %}
      <div>
        <label for="jkSecretkey">
          {{ '_' | jtext: 'JGLOBAL_SECRETKEY' }}
        </label>
        <div>
          <input name="secretkey" id="jkSecretkey" type="text" autocomplete="off" title="{{langtext.secretkey}}" tabindex="0" />
        </div>
      </div>
      {% endif %}
      <p>
        <label for="jkRemember">
          {{ '_' | jtext: 'JGLOBAL_REMEMBER_ME' }}
        </label>
        <input id="jkRemember" type="checkbox" name="remember" value="yes" class="inputbox" />
      </p>
      <p>
        <button type="submit" class="button" tabindex="0" name="Submit" {% if target %} formtarget="_top" {% endif %}>
          {{ '_' | jtext: 'JLOGIN' }}
        </button>
      </p>
    </fieldset>
  
  <input type="hidden" name="option" value="com_users" />
  <input type="hidden" name="task" value="user.login" />
  <input type="hidden" name="return" value="{{return}}" />
  {{token}}
</form>
</div>

<div>
  <ul>
    {% if allowUserRegistration %}
    <li>
      <a href="{{register_url}}" {% if target %} target="_top" {% endif %}>
        {{ '_' | jtext: 'JREGISTER' }}
      </a>
    </li>
    {% endif %}
    <li>
      <a href="{{remind_url}}" {% if target %} target="_top" {% endif %}>
        {{ '_' | jtext: 'COM_JKASSA_ORDER_LOGIN_REMIND' }}
      </a>
    </li>
    <li>
      <a href="{{reset_url}}" {% if target %} target="_top" {% endif %}>
        {{ '_' | jtext: 'COM_JKASSA_ORDER_LOGIN_RESET' }}
      </a>
    </li>
  </ul>
</div>