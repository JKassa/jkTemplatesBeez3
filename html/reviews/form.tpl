<form id="reviewForm">
	<fieldset>
		<p style="margin-bottom: 10px;">
			<label for="reviewRatingStar1">{{ '_' | jtext: 'COM_JKASSA_REVIEWS_1' }}</label>
			<input type="radio" name="reviewRatingStar" id="reviewRatingStar1" value="1">
			<label for="reviewRatingStar2">{{ '_' | jtext: 'COM_JKASSA_REVIEWS_2' }}</label>
			<input type="radio" name="reviewRatingStar" id="reviewRatingStar2" value="2">
			<label for="reviewRatingStar3">{{ '_' | jtext: 'COM_JKASSA_REVIEWS_3' }}</label>
			<input type="radio" name="reviewRatingStar" id="reviewRatingStar3" value="3">
			<label for="reviewRatingStar4">{{ '_' | jtext: 'COM_JKASSA_REVIEWS_4' }}</label>
			<input type="radio" name="reviewRatingStar" id="reviewRatingStar4" value="4">
			<label for="reviewRatingStar5">{{ '_' | jtext: 'COM_JKASSA_REVIEWS_5' }}</label>
			<input type="radio" name="reviewRatingStar" id="reviewRatingStar5" value="5">
		</p>
		<p>
			<label for="reviewDignity">{{ '_' | jtext: 'COM_JKASSA_REVIEWS_DIGNITY' }}</label><br>
			<input type="text" id="reviewDignity" name="reviewDignity">
		</p>
		<p>
			<label for="reviewShortcomings">{{ '_' | jtext: 'COM_JKASSA_REVIEWS_SHORTCOMINGS' }}</label><br>
			<input type="text" id="reviewShortcomings" name="reviewShortcomings">
		</p>
		<p>
			<label for="reviewReview">{{ '_' | jtext: 'COM_JKASSA_REVIEWS_REVIEW' }}</label><br>
			<textarea id="reviewReview" name="reviewReview"></textarea>
		</p>
		<p>
			<label for="reviewName">{{ '_' | jtext: 'COM_JKASSA_YOUR_NAME' }}</label><br>
			{% if user_name %}{% assign readonly_name = ' readonly' %}{% endif %}
			<input type="text" id="reviewName" name="reviewName" value="{{ user_name }}"{{ readonly_name }}>
		</p>
		<p>
			<label for="reviewEmail">{{ '_' | jtext: 'COM_JKASSA_YOUR_EMAIL' }}</label><br>
			{% if user_email %}{% assign readonly_email = ' readonly' %}{% endif %}
			<input type="email" id="reviewEmail" name="reviewEmail" value="{{ user_email }}"{{ readonly_email }}>
		</p>
		<p>
			<label class="checkbox">
				<input type="checkbox" id="reviewNotify" name="reviewNotify" checked>
				{{ '_' | jtext: 'COM_JKASSA_REVIEWS_NOTIFY_ME' }}
			</label>
		</p>
		<p style="margin-top: 10px;">
			<a href="#" class="button" data-click="send-review">
				{{ '_' | jtext: 'COM_JKASSA_REVIEWS_SEND' }}
			</a>
		</p>
		<input type="hidden" name="productID" value="{{ id }}">
	</fieldset>
</form>