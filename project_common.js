function sync_with_that(me,that_element_id)
{
	//alert(me.getAttribute('data-type'));
	target=document.getElementById(that_element_id);
	target.value=me.value
	var event = new Event('change');
	target.dispatchEvent(event);
}
