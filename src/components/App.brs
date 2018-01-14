sub init()
    m.top.state = {
        x: 0
        legalText: "0"
        some: "other"
        stuff: "here"
    }
end sub

sub componentDidMount(p)
    m.top.setFocus(true)
?"APP HAS FOCUS"
end sub

function render(p)
?"render.app", m.top.id

    props = m.top.props
    state = m.top.state

    lblText = props.lblText
    if state.lblText <> invalid then lblText = state.lblText

    legalProps = {}
    legalProps.append(m.top.props)
    legalProps.append(m.top.state)

    listChildren = []
    for i=0 to state.x
        listChildren.push(h("Label", {text: "List Item #" + i.toStr(), translation: [0, i*30]}))
    end for

    return h("Group", {}, [
                h("Label", {id: "lbl", text: lblText}, [
                    h("Legal", legalProps)
                ]),
                h("List", {translation: [100,200]}, listChildren)
            ])
end function

function onKeyEvent(key, press)
?"app onkeyevent", key, press

    if press and key = "down"
        x = m.top.state.x + 1
        m.top.setState = {lblText: "this was updated by a key event", x: x, legalText: x.toStr()}
    end if

    return true
end function
