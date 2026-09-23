return {
  "chrisgrieser/nvim-recorder",
  opts = {
    mapping = {
      startStopRecording = "q",
      playMacro = "Q",
      switchSlot = "<C-q>",
      editMacro = "cq",
      deleteAllMacros = "dq",
      yankMacro = "yq",
      -- ⚠️ this should be a string you don't use in insert mode during a macro
      addBreakPoint = "#*@!*#@(#!@*#!(",
    },

    clear = true,
  }, -- required even with default settings, since it calls `setup()`
}
