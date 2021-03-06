app.view.Viewport = class extends app.toolkit.three.R {

    constructor() {
        super();
    }

    render() {
        let sun = new app.view.milkyway.Sun({ autoInit: true }),
            stars = new app.view.milkyway.Stars({ autoInit: true }),
            orbit = new app.view.milkyway.Orbit({ autoInit: true});
        this.addObject(sun);
        this.addObject(stars);
        this.addObject(orbit);
    }
}
