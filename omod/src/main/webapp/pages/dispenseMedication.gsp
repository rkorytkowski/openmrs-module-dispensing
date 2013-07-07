<%
    if (sessionContext.authenticated && !sessionContext.currentProvider) {
        throw new IllegalStateException("Logged-in user is not a Provider")
    }
    ui.decorateWith("appui", "standardEmrPage")
    ui.includeJavascript("uicommons", "navigator/validators.js", Integer.MAX_VALUE - 19)
    ui.includeJavascript("uicommons", "navigator/navigator.js", Integer.MAX_VALUE - 20)
    ui.includeJavascript("uicommons", "navigator/navigatorHandlers.js", Integer.MAX_VALUE - 21)
    ui.includeJavascript("uicommons", "navigator/navigatorModels.js", Integer.MAX_VALUE - 21)
    ui.includeJavascript("uicommons", "navigator/exitHandlers.js", Integer.MAX_VALUE - 22)
%>
${ ui.includeFragment("uicommons", "validationMessages")}

<script type="text/javascript">
    jQuery(function() {
        KeyboardController();
    });
</script>

<script type="text/javascript">
    var breadcrumbs = [
        { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
        { label: "${ ui.message("dispensing.app.label") }", link: "${ ui.pageLink("dispensing", "dispenseMedication") }" }
    ];
</script>

<div id="content" class="container">
    <h2>
        ${ ui.message("dispensing.app.label") }
    </h2>

    <form class="simple-form-ui" id="dispensing" method="POST">
        <section id="information">
            <span class="title">${ui.message("dispensing.app.information.title")}</span>

            <fieldset>
                <legend>${ui.message("dispensing.app.date.label")}</legend>
                 ${ ui.includeFragment("uicommons", "field/datetimepicker", [
                        label: ui.message("dispensing.app.date.label"),
                        formFieldName: "date",
                        useTime: true,
                        left: true,
                        classes: ["required"]
                  ])}
                  ${ ui.includeFragment("uicommons", "field/dropDown", [
                        label: ui.message("dispensing.app.prescriber.label"),
                        formFieldName: "prescriber",
                        
                        classes: ["required"]
                  ])}
            </fieldset>
            <fieldset>
                <legend>${ui.message("dispensing.app.medication.title")}</legend>
                ${ ui.includeFragment("uicommons", "field/text", [
                        label: ui.message("dispensing.app.name.label"),
                        formFieldName: "name",
                        classes: ["required"]
                ])}
                ${ ui.includeFragment("uicommons", "field/text", [
                        label: ui.message("dispensing.app.frequency.label"),
                        formFieldName: "frequency",
                        classes: ["required"]
                ])}
                ${ ui.includeFragment("uicommons", "field/text", [
                        label: ui.message("dispensing.app.dose.label"),
                        formFieldName: "dose",
                        classes: ["required"]
                ])}
                ${ ui.includeFragment("uicommons", "field/text", [
                        label: ui.message("dispensing.app.duration.label"),
                        formFieldName: "duration",
                        classes: ["required"]
                ])}
                ${ ui.includeFragment("uicommons", "field/text", [
                        label: ui.message("dispensing.app.amount.label"),
                        formFieldName: "amount",
                        classes: ["required"]
                ])}
            </fieldset>

        </section>
        <div id="confirmation">
            <span class="title">${ui.message("dispensing.app.confirm.label")}</span>
            <div class="before-dataCanvas"></div>
            <div id="dataCanvas"></div>
            <div class="after-data-canvas"></div>
            <div id="confirmationQuestion">
                Confirm submission? <p style="display: inline"><input type="submit" class="confirm" value="Yes" /></p> or <p style="display: inline"><input id="cancelSubmission" class="cancel" type="button" value="No" /></p>
            </div>
        </div>
    </form>
</div>
